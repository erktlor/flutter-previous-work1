import 'package:flutter_web_app/store/prospector/prospector.actions.dart';
import 'package:flutter_web_app/store/prospector/prospector.types.dart';

ProspectorState prospectorReducer(ProspectorState state, action) {
  if (action is GetProspectorResultsSuccessAction) {
    return state.copyWith(results: action.results);
  }

  if (action is UpdateProspectorAction) {
    return state.copyWith(
        callsDialed: action.callsDialed ?? state.callsDialed,
        callsReached: action.callsReached ?? state.callsReached,
        appointments: action.appointments ?? state.appointments);
  }

  if (action is SaveProspectorResultSuccessAction) {
    return state.copyWith(
        callsDialed: 0,
        callsReached: 0,
        appointments: 0,
        results: []
          ..addAll(state.results)
          ..add(action.result));
  }

  if (action is GetProspectorSettingsSuccessAction) {
    return state.copyWith(settings: action.settings);
  }

  if (action is SaveProspectorSettingsSuccessAction) {
    return state.copyWith(settings: action.settings);
  }

  return state;
}
