import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/store/courses/courses.actions.dart';
import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/store.dart';

CourseModel courseSelector(ApplicationState state) {
  return state.courses.course;
}

List<SearchContentModel> searchCoursesSelector(ApplicationState state) {
  return state.courses.searchCourses;
}

CourseResultModel courseResultSelector(ApplicationState state) {
  return state.courses.courseResult;
}

Function lessonResultSelector(String lessonId) {
  return (ApplicationState state) {
    return state.courses.courseResult.getLessonResult(lessonId);
  };
}

Function topicResultSelector(String topicId) {
  return (ApplicationState state) {
    return state.courses.courseResult.getTopicResult(topicId);
  };
}

bool isUpdatingCourseResultSelector(ApplicationState state) {
  return createLoadingSelector([UpdateCourseResultAction])(state);
}

bool isUpdatingLessonResultSelector(ApplicationState state) {
  return createLoadingSelector([UpdateLessonResultAction])(state);
}
