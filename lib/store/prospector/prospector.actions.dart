import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/prospector_result.model.dart';
import 'package:flutter_web_app/common/models/prospector_settings.model.dart';

// Get results
class GetProspectorResultsAction {}

class GetProspectorResultsRequestAction {}

class GetProspectorResultsSuccessAction {
  final List<ProspectorResultModel> results;

  GetProspectorResultsSuccessAction({@required this.results});
}

class GetProspectorResultsFailureAction {}

// Update
class UpdateProspectorAction {
  final int callsDialed;
  final int callsReached;
  final int appointments;

  UpdateProspectorAction({
    this.callsDialed,
    this.callsReached,
    this.appointments,
  });
}

// Save result
class SaveProspectorResultAction {
  final int seconds;

  SaveProspectorResultAction({@required this.seconds});
}

class SaveProspectorResultRequestAction {}

class SaveProspectorResultSuccessAction {
  final ProspectorResultModel result;

  SaveProspectorResultSuccessAction({@required this.result});
}

class SaveProspectorResultFailureAction {}

// Get settings
class GetProspectorSettingsAction {}

class GetProspectorSettingsRequestAction {}

class GetProspectorSettingsSuccessAction {
  final ProspectorSettingsModel settings;

  GetProspectorSettingsSuccessAction({@required this.settings});
}

class GetProspectorSettingsFailureAction {}

// Save settings
class SaveProspectorSettingsAction {
  final int weeklyTarget;

  SaveProspectorSettingsAction({@required this.weeklyTarget});
}

class SaveProspectorSettingsRequestAction {}

class SaveProspectorSettingsSuccessAction {
  final ProspectorSettingsModel settings;

  SaveProspectorSettingsSuccessAction({@required this.settings});
}

class SaveProspectorSettingsFailureAction {}

// Download CSV
class GetProspectorCSVResultsAction {}

class GetProspectorCSVResultsRequestAction {}

class GetProspectorCSVResultsSuccessAction {}

class GetProspectorCSVResultsFailureAction {}
