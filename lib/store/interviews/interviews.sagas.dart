import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/models/interview.model.dart';
import 'package:flutter_web_app/common/models/interview_result.model.dart';
import 'package:flutter_web_app/common/models/search_interview.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/store/interviews/interviews.actions.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetInterviews({GetInterviewsAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetInterviewsRequestAction());

    final result = Result<Response>();

    yield Call(Api.getInterviews, args: [action.type], result: result);

    List<SearchInterviewModel> interviews = result.value.data['interviews']
        .map<SearchInterviewModel>(
            (jsonItem) => SearchInterviewModel.fromJson(jsonItem))
        .toList();

    yield Put(GetInterviewsSuccessAction(interviews: interviews));
  }, Catch: (e, s) sync* {
    yield Put(GetInterviewsFailureAction());
  });
}

_handleGetInterview({GetInterviewAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetInterviewRequestAction());

    final result = Result<Response>();

    yield Call(Api.getInterview, args: [action.interviewId], result: result);

    yield Put(GetInterviewSuccessAction(
        interview: InterviewModel.fromJson(result.value.data)));
  }, Catch: (e, s) sync* {
    if (e is DioError) {
      if (e.response.statusCode == 403) {
        navigatorKey.currentState.pushReplacementNamed(Routes.dashboard);
        toast('Interview is not available');
      }
    }

    yield Put(GetInterviewFailureAction());
  });
}

_handleGetInterviewResult({GetInterviewResultAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetInterviewResultRequestAction());

    final result = Result<Response>();

    yield Call(Api.getInterviewResult,
        args: [action.interviewId], result: result);

    InterviewResultModel interviewResult =
        InterviewResultModel.fromJson(result.value.data);

    yield Put(
        GetInterviewResultSuccessAction(interviewResult: interviewResult));
  }, Catch: (e, s) sync* {
    yield Put(GetInterviewResultFailureAction());
  });
}

_handleUpdateInterviewResult({UpdateInterviewResultAction action}) sync* {
  yield Try(() sync* {
    yield Put(UpdateInterviewResultRequestAction());

    toast('Saving...');

    final result = Result<Response>();

    yield Call(Api.updateInterviewResult,
        args: [action.interviewId, action.interviewResult.toJson()],
        result: result);

    InterviewResultModel interviewResult =
        InterviewResultModel.fromJson(result.value.data);

    yield Put(
        UpdateInterviewResultSuccessAction(interviewResult: interviewResult));

    toast('Saved');
  }, Catch: (e, s) sync* {
    yield Put(UpdateInterviewResultFailureAction());
  });
}

_handleGetInterviewKickstartVisibilityAction(
    {GetInterviewKickstartVisibilityAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetInterviewKickstartVisibilityRequestAction());

    final result = Result<Response>();

    yield Call(Api.getInterviewKickstartVisibility, result: result);

    final visible = result.value.data['visible'];

    yield Put(GetInterviewKickstartVisibilitySuccessAction(visible: visible));
  }, Catch: (e, s) sync* {
    yield Put(GetInterviewKickstartVisibilityFailureAction());
  });
}

_watchGetInterviews() sync* {
  yield TakeLeading(_handleGetInterviews, pattern: GetInterviewsAction);
}

_watchGetInterview() sync* {
  yield TakeLeading(_handleGetInterview, pattern: GetInterviewAction);
}

_watchGetInterviewResult() sync* {
  yield TakeLeading(_handleGetInterviewResult,
      pattern: GetInterviewResultAction);
}

_watchUpdateInterviewResult() sync* {
  yield TakeLeading(_handleUpdateInterviewResult,
      pattern: UpdateInterviewResultAction);
}

_watchGetInterviewKickstartVisibilityAction() sync* {
  yield TakeLeading(_handleGetInterviewKickstartVisibilityAction,
      pattern: GetInterviewKickstartVisibilityAction);
}

interviewsSaga() sync* {
  yield Fork(_watchGetInterviews);
  yield Fork(_watchGetInterview);
  yield Fork(_watchGetInterviewResult);
  yield Fork(_watchUpdateInterviewResult);
  yield Fork(_watchGetInterviewKickstartVisibilityAction);
}
