import 'package:flutter_web_app/store/subjects/subjects.actions.dart';
import 'package:flutter_web_app/store/subjects/subjects.types.dart';

SubjectsState subjectsReducer(SubjectsState state, action) {
  if (action is GetSubjectsContentCountSuccessAction) {
    return state.copyWith(subjectsContentCount: action.subjectsContentCount);
  }

  return state;
}
