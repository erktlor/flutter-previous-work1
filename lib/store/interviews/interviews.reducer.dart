import 'package:flutter_web_app/store/interviews/interviews.actions.dart';
import 'package:flutter_web_app/store/interviews/interviews.types.dart';

InterviewsState interviewsReducer(InterviewsState state, action) {
  if (action is GetInterviewsAction) {
    return state.copyWith(interviews: []);
  }

  if (action is GetInterviewsSuccessAction) {
    return state.copyWith(interviews: action.interviews);
  }

  if (action is GetInterviewAction) {
    return state.copyWith(interview: null);
  }

  if (action is GetInterviewSuccessAction) {
    return state.copyWith(interview: action.interview);
  }

  if (action is GetInterviewResultAction) {
    return state.copyWith(interviewResult: null);
  }

  if (action is GetInterviewResultSuccessAction) {
    return state.copyWith(interviewResult: action.interviewResult);
  }

  if (action is UpdateInterviewResultSuccessAction) {
    return state.copyWith(interviewResult: action.interviewResult);
  }

  if (action is GetInterviewKickstartVisibilitySuccessAction) {
    return state.copyWith(kickstartVisible: action.visible);
  }

  return state;
}
