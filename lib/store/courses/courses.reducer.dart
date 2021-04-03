import 'package:flutter_web_app/store/courses/courses.actions.dart';
import 'package:flutter_web_app/store/courses/courses.types.dart';

CoursesState coursesReducer(CoursesState state, action) {
  if (action is SearchCoursesSuccessAction) {
    return state.copyWith(searchCourses: action.searchCourses);
  }

  if (action is GetCourseAction) {
    return state.copyWith(course: null);
  }

  if (action is GetCourseSuccessAction) {
    return state.copyWith(course: action.course);
  }

  if (action is GetCourseResultSuccessAction) {
    return state.copyWith(courseResult: action.courseResult);
  }

  if (action is UpdateCourseResultSuccessAction) {
    return state.copyWith(courseResult: action.courseResult);
  }

  if (action is UpdateLessonResultSuccessAction) {
    return state.copyWith(
        courseResult: state.courseResult.copyWith(
            lessonsResults: state.courseResult.lessonsResults
                .map((lessonResult) =>
                    lessonResult.lessonId == action.lessonResult.lessonId
                        ? action.lessonResult
                        : lessonResult)
                .toList()));
  }

  if (action is UpdateTopicResultSuccessAction) {
    return state.copyWith(
        courseResult: state.courseResult.copyWith(
            lessonsResults: state.courseResult.lessonsResults
                .map((lessonResult) => lessonResult.lessonId != action.lessonId
                    ? lessonResult
                    : lessonResult.copyWith(
                        topicsResults: lessonResult.topicsResults
                            .map((topicResult) => topicResult.topicId !=
                                    action.topicResult.topicId
                                ? topicResult
                                : action.topicResult)
                            .toList()))
                .toList()));
  }

  return state;
}
