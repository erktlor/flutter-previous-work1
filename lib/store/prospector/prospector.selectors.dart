import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/prospector/prospector.actions.dart';
import 'package:flutter_web_app/store/store.dart';

prospectorResultsSelector(ApplicationState state) {
  return state.prospector.results;
}

prospectorSettingsSelector(ApplicationState state) {
  return state.prospector.settings;
}

prospectorCallsDialedSelector(ApplicationState state) {
  return state.prospector.callsDialed;
}

prospectorCallsReachedSelector(ApplicationState state) {
  return state.prospector.callsReached;
}

prospectorAppointmentsSelector(ApplicationState state) {
  return state.prospector.appointments;
}

bool isSavingProspectorResultSelector(ApplicationState state) {
  return createLoadingSelector([SaveProspectorResultAction])(state);
}
