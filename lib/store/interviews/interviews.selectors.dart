import 'package:flutter_web_app/common/models/interview.model.dart';
import 'package:flutter_web_app/common/models/interview_result.model.dart';
import 'package:flutter_web_app/common/models/search_interview.model.dart';
import 'package:flutter_web_app/store/interviews/interviews.actions.dart';
import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/store.dart';

List<SearchInterviewModel> interviewsSelector(ApplicationState state) {
  return state.interviews.interviews;
}

InterviewModel interviewSelector(ApplicationState state) {
  return state.interviews.interview;
}

InterviewResultModel interviewResultSelector(ApplicationState state) {
  return state.interviews.interviewResult;
}

bool isFetchingInterviewsSelector(ApplicationState state) {
  return createLoadingSelector([GetInterviewsAction])(state);
}

bool isUpdatingInterviewResultSelector(ApplicationState state) {
  return createLoadingSelector([UpdateInterviewResultAction])(state);
}

bool kickstartVisibleSelector(ApplicationState state) {
  return state.interviews.kickstartVisible;
}
