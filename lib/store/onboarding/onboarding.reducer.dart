import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.actions.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.types.dart';
import 'package:flutter_web_app/utils/index_by_id.dart';

OnboardingState onboardingReducer(OnboardingState state, action) {
  if (action is GetOnboardingSubjectsSuccessAction) {
    return state.copyWith(subjects: action.subjects);
  }

  if (action is GetOnboardingAvatarsSuccessAction) {
    return state.copyWith(avatars: action.avatars);
  }

  if (action is SelectOnboardingSubjectAction) {
    final List<SubjectModel> selectedSubjectsCopy = []
      ..addAll(state.selectedSubjects);

    final index = indexById(selectedSubjectsCopy, action.subject);

    if (index != -1) {
      selectedSubjectsCopy.removeAt(index);
    } else {
      selectedSubjectsCopy.add(action.subject);
    }

    return state.copyWith(selectedSubjects: selectedSubjectsCopy);
  }

  if (action is SelectOnboardingAvatarAction) {
    return state.copyWith(selectedAvatar: action.avatar);
  }

  if (action is GetOnboardingResultsSuccessAction) {
    return state.copyWith(
        selectedSubjects: action.subjects, selectedAvatar: action.avatar);
  }

  return state;
}
