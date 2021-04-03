import 'package:flutter_web_app/common/models/resource.model.dart';
import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/resources/resources.actions.dart';
import 'package:flutter_web_app/store/store.dart';

List<ResourceModel> resourcesSelector(ApplicationState state) {
  return state.resources.resources;
}

bool isFetchingResourcesSelector(ApplicationState state) {
  return createLoadingSelector([GetResourcesAction])(state);
}
