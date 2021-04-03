import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/store/content_progress/content_progress.actions.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetContentProgress({GetContentProgressAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetContentProgressRequestAction());

    final result = Result<Response>();

    yield Call(Api.getContentProgress,
        args: [action.contentUri], result: result);

    yield Put(GetContentProgressSuccessAction(
        seconds: result.value.data['seconds'], contentUri: action.contentUri));
  }, Catch: (e, s) sync* {
    yield Put(GetContentProgressFailureAction());
  });
}

_handleUpdateContentProgress({UpdateContentProgressAction action}) sync* {
  yield Try(() sync* {
    yield Put(UpdateContentProgressRequestAction());

    final result = Result<Response>();

    yield Call(Api.updateContentProgress,
        args: [
          {'contentUri': action.contentUri, 'seconds': action.seconds}
        ],
        result: result);

    yield Put(UpdateContentProgressSuccessAction(
        seconds: result.value.data['seconds'], contentUri: action.contentUri));
  }, Catch: (e, s) sync* {
    yield Put(UpdateContentProgressFailureAction());
  });
}

_watchGetContentProgress() sync* {
  yield TakeEvery(_handleGetContentProgress, pattern: GetContentProgressAction);
}

_watchUpdateContentProgress() sync* {
  yield TakeEvery(_handleUpdateContentProgress,
      pattern: UpdateContentProgressAction);
}

contentProgressSaga() sync* {
  yield Fork(_watchGetContentProgress);
  yield Fork(_watchUpdateContentProgress);
}
