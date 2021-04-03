import 'dart:async';
import 'dart:math';

import 'package:dart_date/dart_date.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/prospector_values.dart';
import 'package:flutter_web_app/common/constants/storage_keys.dart';
import 'package:flutter_web_app/common/models/prospector_result.model.dart';
import 'package:flutter_web_app/common/models/prospector_settings.model.dart';
import 'package:flutter_web_app/store/prospector/prospector.actions.dart';
import 'package:flutter_web_app/store/prospector/prospector.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/async_storage.dart';
import 'package:flutter_web_app/utils/get_time_from_seconds.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/prospector/my_prospector/progress_details.dart';
import 'package:flutter_web_app/widgets/selected_button/selected_button.dart';
import 'package:redux/redux.dart';

import 'results_data_table.dart';
import 'session_timer.dart';

class _MyProspectorSections {
  static final sessionTimer = 1;
  static final progressDetails = 2;
  static final dataTable = 3;
}

class MyProspector extends StatefulWidget {
  @override
  _MyProspectorState createState() => _MyProspectorState();
}

class _MyProspectorState extends State<MyProspector> {
  int activeSection = _MyProspectorSections.sessionTimer;
  Timer timer;
  int seconds = ProspectorValues.defaultSecondsDuration;
  int secondsPassed = 0;
  DateTime startDateTime;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    final prospectorSecondsPassed =
        await AsyncStorage.getStringData(StorageKeys.prospectorSecondsPassed);
    final prospectorStartDateTime =
        await AsyncStorage.getStringData(StorageKeys.prospectorStartDateTime);

    setState(() {
      secondsPassed = prospectorSecondsPassed != null
          ? int.parse(prospectorSecondsPassed)
          : 0;
      startDateTime = prospectorStartDateTime != null
          ? DateTime.parse(prospectorStartDateTime)
          : null;
    });

    update();
  }

  void onStart() async {
    final now = DateTime.now();

    setState(() {
      startDateTime = now;
    });

    await AsyncStorage.saveStringData(
        StorageKeys.prospectorStartDateTime, now.toString());

    update();
  }

  void onPause() async {
    final secondsDiff = DateTime.now().differenceInSeconds(startDateTime);

    setState(() {
      secondsPassed += secondsDiff;
      startDateTime = null;
    });

    await AsyncStorage.clear(StorageKeys.prospectorStartDateTime);
    await AsyncStorage.saveStringData(
        StorageKeys.prospectorSecondsPassed, secondsPassed.toString());

    update();
  }

  void update() async {
    final secondsDiff = startDateTime != null
        ? DateTime.now().differenceInSeconds(startDateTime)
        : 0;

    final secondsResult =
        ProspectorValues.defaultSecondsDuration - secondsDiff - secondsPassed;

    if (secondsResult <= 0) {
      complete();
    } else {
      setState(() {
        seconds = secondsResult;
      });
    }
  }

  void complete() async {
    setState(() {
      secondsPassed = ProspectorValues.defaultSecondsDuration;
      startDateTime = null;
      seconds = 0;
    });

    await AsyncStorage.saveStringData(
        StorageKeys.prospectorSecondsPassed, secondsPassed.toString());
    await AsyncStorage.clear(StorageKeys.prospectorStartDateTime);
  }

  void onReset() async {
    setState(() {
      secondsPassed = 0;
      startDateTime = null;
    });

    await AsyncStorage.clear(StorageKeys.prospectorStartDateTime);
    await AsyncStorage.clear(StorageKeys.prospectorSecondsPassed);

    update();
  }

  @override
  Widget build(BuildContext context) {
    var mobile = isMobile(context);

    return StoreConnector<ApplicationState, _MyProspectorProps>(
      onInitialBuild: (props) {
        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          update();
        });
      },
      onDispose: (_) {
        timer.cancel();
      },
      builder: (context, props) {
        return Container(
          padding: const EdgeInsets.all(10),
          width:
              mobile ? double.infinity : MediaQuery.of(context).size.width / 2,
          child: Column(
            children: [
              buildHeader(),
              if (activeSection == _MyProspectorSections.sessionTimer)
                SessionTimer(
                  active: startDateTime != null,
                  time: getTimeFromSeconds(seconds),
                  saving: props.saving,
                  onStart: onStart,
                  onPause: onPause,
                  onReset: () {
                    onReset();
                    props.onProspectorUpdate(
                      callsDialed: 0,
                      callsReached: 0,
                      appointments: 0,
                    );
                  },
                  callsDialed: props.callsDialed,
                  callsReached: props.callsReached,
                  appointments: props.appointments,
                  onCallsDialedChanged: (int value) =>
                      props.onProspectorUpdate(callsDialed: max(0, value)),
                  onCallsReachedChanged: (int value) =>
                      props.onProspectorUpdate(callsReached: max(0, value)),
                  onAppointmentsChanged: (int value) =>
                      props.onProspectorUpdate(appointments: max(0, value)),
                  onSave: () {
                    props.onSave(seconds);
                    onReset();
                  },
                ),
              if (activeSection == _MyProspectorSections.progressDetails)
                ProgressDetails(
                    onSaveSettings: props.onProspectorSaveSettings,
                    results: props.results,
                    settings: props.settings),
              if (activeSection == _MyProspectorSections.dataTable)
                ResultsDataTable(
                  onGetCSVResults: props.onGetCSVResults,
                  results: props.results,
                )
            ],
          ),
        );
      },
      converter: _MyProspectorProps.fromStore,
      distinct: true,
    );
  }

  Widget buildHeader() {
    var mobile = isMobile(context);

    final firstBR = mobile
        ? BorderRadius.zero
        : const BorderRadius.only(
            topLeft: Radius.circular(25), bottomLeft: Radius.circular(25));

    final lastBR = mobile
        ? BorderRadius.zero
        : const BorderRadius.only(
            topRight: Radius.circular(25), bottomRight: Radius.circular(25));

    List<Widget> children = [
      Flexible(
        flex: mobile ? 0 : 1,
        child: ClipRRect(
          borderRadius: firstBR,
          child: SizedBox(
            height: 50,
            child: SelectedButton(
                selected: activeSection == _MyProspectorSections.sessionTimer,
                text: 'Session Timer',
                onPressed: () => setState(() {
                      activeSection = _MyProspectorSections.sessionTimer;
                    })),
          ),
        ),
      ),
      Flexible(
        flex: mobile ? 0 : 1,
        child: SizedBox(
          height: 50,
          child: SelectedButton(
              selected: activeSection == _MyProspectorSections.progressDetails,
              text: 'Progress Details',
              onPressed: () => setState(() {
                    activeSection = _MyProspectorSections.progressDetails;
                  })),
        ),
      ),
      Flexible(
        flex: mobile ? 0 : 1,
        child: ClipRRect(
          borderRadius: lastBR,
          child: SizedBox(
            height: 50,
            child: SelectedButton(
                selected: activeSection == _MyProspectorSections.dataTable,
                text: 'Data Table',
                onPressed: () => setState(() {
                      activeSection = _MyProspectorSections.dataTable;
                    })),
          ),
        ),
      )
    ];

    if (mobile) {
      return Column(
        children: children,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}

class _MyProspectorProps extends Equatable {
  final int callsDialed;
  final int callsReached;
  final int appointments;
  final bool saving;
  final Function({int callsDialed, int callsReached, int appointments})
      onProspectorUpdate;
  final Function(int) onSave;

  final Function(int) onProspectorSaveSettings;
  final List<ProspectorResultModel> results;
  final ProspectorSettingsModel settings;
  final Function onGetCSVResults;

  _MyProspectorProps(
      {@required this.callsDialed,
      @required this.callsReached,
      @required this.appointments,
      @required this.results,
      @required this.settings,
      @required this.saving,
      @required this.onProspectorUpdate,
      @required this.onSave,
      @required this.onProspectorSaveSettings,
      @required this.onGetCSVResults});

  static _MyProspectorProps fromStore(Store<ApplicationState> store) {
    return _MyProspectorProps(
        callsDialed: prospectorCallsDialedSelector(store.state),
        callsReached: prospectorCallsReachedSelector(store.state),
        appointments: prospectorAppointmentsSelector(store.state),
        results: prospectorResultsSelector(store.state),
        settings: prospectorSettingsSelector(store.state),
        saving: isSavingProspectorResultSelector(store.state),
        onProspectorUpdate: ({
          int callsDialed,
          int callsReached,
          int appointments,
        }) {
          store.dispatch(UpdateProspectorAction(
              callsDialed: callsDialed,
              callsReached: callsReached,
              appointments: appointments));
        },
        onSave: (seconds) {
          store.dispatch(SaveProspectorResultAction(seconds: seconds));
        },
        onProspectorSaveSettings: (int weeklyTarget) {
          store.dispatch(
              SaveProspectorSettingsAction(weeklyTarget: weeklyTarget));
        },
        onGetCSVResults: () {
          store.dispatch(GetProspectorCSVResultsAction());
        });
  }

  @override
  List<Object> get props =>
      [callsDialed, callsReached, appointments, results, settings, saving];
}
