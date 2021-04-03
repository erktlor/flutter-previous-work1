import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/store/presenters/presenters.actions.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetPresenters({GetPresentersAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetPresentersRequestAction());

    final result = Result<Response>();

    yield Call(Api.getPresenters, result: result);

    List<PresenterModel> presenters = result.value.data
        .map<PresenterModel>(
            (jsonPresenter) => PresenterModel.fromJson(jsonPresenter))
        .toList();

    yield Put(GetPresentersSuccessAction(presenters: presenters));
  }, Catch: (e, s) sync* {
    yield Put(GetPresentersFailureAction());
  });
}

_watchGetPresenters() sync* {
  yield TakeLeading(_handleGetPresenters, pattern: GetPresentersAction);
}

presentersSaga() sync* {
  yield Fork(_watchGetPresenters);
}
