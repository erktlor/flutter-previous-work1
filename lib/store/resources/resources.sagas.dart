import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/models/resource.model.dart';
import 'package:flutter_web_app/store/resources/resources.actions.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetResources({GetResourcesAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetResourcesRequestAction());

    final result = Result<Response>();

    yield Call(Api.getResources, result: result);

    List<ResourceModel> resources = result.value.data
        .map<ResourceModel>(
            (jsonResource) => ResourceModel.fromJson(jsonResource))
        .toList();

    yield Put(GetResourcesSuccessAction(resources: resources));
  }, Catch: (e, s) sync* {
    yield Put(GetResourcesFailureAction());
  });
}

_watchGetResources() sync* {
  yield TakeLeading(_handleGetResources, pattern: GetResourcesAction);
}

resourcesSaga() sync* {
  yield Fork(_watchGetResources);
}
