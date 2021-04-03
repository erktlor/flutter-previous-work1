import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/store/prospector/prospector.actions.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:flutter_web_app/widgets/prospector/prospector_content/prospector_content.dart';
import 'package:redux/redux.dart';

class Prospector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _ProspectorProps>(
      onInitialBuild: (props) {
        props.getProspectorResults();
        props.getProspectorSettings();
      },
      builder: (context, props) {
        return Scaffold(
          body: PageLayout(
            header: AuthorizedHeader(),
            child: ProspectorContent(),
          ),
        );
      },
      converter: _ProspectorProps.fromStore,
      distinct: true,
    );
  }
}

class _ProspectorProps extends Equatable {
  final Function getProspectorResults;
  final Function getProspectorSettings;

  _ProspectorProps(
      {@required this.getProspectorResults,
      @required this.getProspectorSettings});

  static _ProspectorProps fromStore(Store<ApplicationState> store) {
    return _ProspectorProps(getProspectorResults: () {
      store.dispatch(GetProspectorResultsAction());
    }, getProspectorSettings: () {
      store.dispatch(GetProspectorSettingsAction());
    });
  }

  @override
  List<Object> get props => [];
}
