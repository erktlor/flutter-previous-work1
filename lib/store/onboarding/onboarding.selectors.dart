import 'package:flutter_web_app/common/models/avatar.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.actions.dart';
import 'package:flutter_web_app/store/store.dart';

List<SubjectModel> onboardingSubjectsSelector(ApplicationState state) {
  return state.onboarding.subjects;
}

List<SubjectModel> onboardingSelectedSubjectsSelector(ApplicationState state) {
  return state.onboarding.selectedSubjects;
}

bool isFetchingOnboardingSubjectsSelector(ApplicationState state) {
  return createLoadingSelector([GetOnboardingSubjectsAction])(state);
}

List<AvatarModel> onboardingAvatarsSelector(ApplicationState state) {
  return state.onboarding.avatars;
}

AvatarModel onboardingSelectedAvatarSelector(ApplicationState state) {
  return state.onboarding.selectedAvatar;
}

bool isFetchingOnboardingAvatarsSelector(ApplicationState state) {
  return createLoadingSelector([GetOnboardingAvatarsAction])(state);
}

bool isSavingOnboardingResultsSelector(ApplicationState state) {
  return createLoadingSelector([SaveOnboardingResultsAction])(state);
}

bool isFetchingOnboardingResultsSelector(ApplicationState state) {
  return createLoadingSelector([GetOnboardingResultsAction])(state);
}
