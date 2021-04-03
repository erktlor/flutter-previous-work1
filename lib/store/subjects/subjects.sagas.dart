import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/models/subjects_content_count.model.dart';
import 'package:flutter_web_app/store/subjects/subjects.actions.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetSubjectsContentCount({GetSubjectsContentCountAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetSubjectsContentCountRequestAction());

    final result = Result<Response>();

    yield Call(Api.getSubjectsContentCount, result: result);

    List<SubjectsContentCountModel> subjectsContentCount = result.value.data
        .map<SubjectsContentCountModel>(
            (jsonItem) => SubjectsContentCountModel.fromJson(jsonItem))
        .toList();

    yield Put(GetSubjectsContentCountSuccessAction(
        subjectsContentCount: subjectsContentCount));
  }, Catch: (e, s) sync* {
    yield Put(GetSubjectsContentCountFailureAction());
  });
}

_watchGetSubjectsContentCount() sync* {
  yield TakeLeading(_handleGetSubjectsContentCount,
      pattern: GetSubjectsContentCountAction);
}

subjectsSaga() sync* {
  yield Fork(_watchGetSubjectsContentCount);
}
