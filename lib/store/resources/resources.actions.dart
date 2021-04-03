// Get resources
import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/resource.model.dart';

class GetResourcesAction {}

class GetResourcesRequestAction {}

class GetResourcesSuccessAction {
  final List<ResourceModel> resources;

  GetResourcesSuccessAction({@required this.resources});
}

class GetResourcesFailureAction {}
