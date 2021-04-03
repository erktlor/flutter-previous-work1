import 'package:flutter_web_app/store/resources/resources.actions.dart';
import 'package:flutter_web_app/store/resources/resources.types.dart';

ResourcesState resourcesReducer(ResourcesState state, action) {
  if (action is GetResourcesSuccessAction) {
    return ResourcesState(resources: action.resources);
  }

  return state;
}
