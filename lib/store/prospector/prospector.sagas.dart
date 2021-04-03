import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/constants/prospector_values.dart';
import 'package:flutter_web_app/common/models/prospector_result.model.dart';
import 'package:flutter_web_app/common/models/prospector_settings.model.dart';
import 'package:flutter_web_app/store/prospector/prospector.actions.dart';
import 'package:flutter_web_app/store/prospector/prospector.selectors.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetProspectorResults({GetProspectorResultsAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetProspectorResultsRequestAction());

    final result = Result<Response>();

    yield Call(Api.getProspectorResults, result: result);

    List<ProspectorResultModel> results = result.value.data
        .map<ProspectorResultModel>(
            (jsonData) => ProspectorResultModel.fromJson(jsonData))
        .toList();

    yield Put(GetProspectorResultsSuccessAction(results: results));
  }, Catch: (e, s) sync* {
    yield Put(GetProspectorResultsFailureAction());
  });
}

// _handleStartProspectorTimer({StartProspectorTimerAction action}) sync* {
//   final startDateResult = Result<String>();
//   yield Call(AsyncStorage.getStringData,
//       args: [StorageKeys.prospectorStartDateTime], result: startDateResult);
//
//   // Timer is already set up
//   if (startDateResult.value != null) {
//     return;
//   }
//
//   final startDate = DateTime.now();
//
//   yield Call(AsyncStorage.saveStringData,
//       args: [StorageKeys.prospectorStartDateTime, startDate.toString()]);
// }

_handleSaveProspectorResult({SaveProspectorResultAction action}) sync* {
  yield Try(() sync* {
    yield Put(SaveProspectorResultRequestAction());

    final callsDialedResult = Result<int>();
    yield Select(
        selector: prospectorCallsDialedSelector, result: callsDialedResult);

    final callsReachedResult = Result<int>();
    yield Select(
        selector: prospectorCallsReachedSelector, result: callsReachedResult);

    final appointmentsResult = Result<int>();
    yield Select(
        selector: prospectorAppointmentsSelector, result: appointmentsResult);

    final body = {
      'seconds': ProspectorValues.defaultSecondsDuration - action.seconds,
      'callsDialed': callsDialedResult.value,
      'callsReached': callsReachedResult.value,
      'appointments': appointmentsResult.value
    };

    final result = Result<Response>();

    yield Call(Api.saveProspectorResult, args: [body], result: result);

    toast('Saved');

    yield Put(SaveProspectorResultSuccessAction(
        result: ProspectorResultModel.fromJson(result.value.data)));
  }, Catch: (e, s) sync* {
    yield Put(SaveProspectorResultFailureAction());
  });
}

_handleGetProspectorSettings({GetProspectorSettingsAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetProspectorSettingsRequestAction());

    final result = Result<Response>();

    yield Call(Api.getProspectorSettings, result: result);

    yield Put(GetProspectorSettingsSuccessAction(
        settings: ProspectorSettingsModel.fromJson(result.value.data)));
  }, Catch: (e, s) sync* {
    yield Put(GetProspectorSettingsFailureAction());
  });
}

_handleSaveProspectorSettings({SaveProspectorSettingsAction action}) sync* {
  yield Try(() sync* {
    yield Put(SaveProspectorSettingsFailureAction());

    final result = Result<Response>();

    final body = {'weeklyTarget': action.weeklyTarget};

    yield Call(Api.saveProspectorSettings, args: [body], result: result);

    yield Put(SaveProspectorSettingsSuccessAction(
        settings: ProspectorSettingsModel.fromJson(result.value.data)));
  }, Catch: (e, s) sync* {
    yield Put(SaveProspectorSettingsFailureAction());
  });
}

_handleGetProspectorCSVResultsAction(
    {GetProspectorCSVResultsAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetProspectorCSVResultsRequestAction());

    final result = Result<Response>();

    yield Call(Api.getProspectorCSVResults, result: result);

    openLink(result.value.data['fileUri']);

    yield Put(GetProspectorCSVResultsSuccessAction());
  }, Catch: (e, s) sync* {
    yield Put(GetProspectorCSVResultsFailureAction());
  });
}

_watchGetProspectorResults() sync* {
  yield TakeLeading(_handleGetProspectorResults,
      pattern: GetProspectorResultsAction);
}

_watchSaveProspectorResult() sync* {
  yield TakeLeading(_handleSaveProspectorResult,
      pattern: SaveProspectorResultAction);
}

_watchGetProspectorSettings() sync* {
  yield TakeLeading(_handleGetProspectorSettings,
      pattern: GetProspectorSettingsAction);
}

_watchSaveProspectorSettings() sync* {
  yield TakeLeading(_handleSaveProspectorSettings,
      pattern: SaveProspectorSettingsAction);
}

_watchGetProspectorCSVResultsAction() sync* {
  yield TakeLeading(_handleGetProspectorCSVResultsAction,
      pattern: GetProspectorCSVResultsAction);
}

prospectorSaga() sync* {
  yield Fork(_watchGetProspectorResults);
  yield Fork(_watchSaveProspectorResult);
  yield Fork(_watchGetProspectorSettings);
  yield Fork(_watchSaveProspectorSettings);
  yield Fork(_watchGetProspectorCSVResultsAction);
}
