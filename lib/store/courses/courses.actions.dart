import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/common/models/lesson_result.model.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/common/models/topic_result.model.dart';

// Get courses
class SearchCoursesAction {}

class SearchCoursesRequestAction {}

class SearchCoursesSuccessAction {
  final List<SearchContentModel> searchCourses;

  SearchCoursesSuccessAction({@required this.searchCourses});
}

class GetCoursesFailureAction {}

// Get course
class GetCourseAction {
  final String courseId;

  GetCourseAction({@required this.courseId});
}

class GetCourseRequestAction {}

class GetCourseSuccessAction {
  final CourseModel course;

  GetCourseSuccessAction({@required this.course});
}

class GetCourseFailureAction {}

// Get course result
class GetCourseResultAction {
  final String courseId;

  GetCourseResultAction({@required this.courseId});
}

class GetCourseResultRequestAction {}

class GetCourseResultSuccessAction {
  final CourseResultModel courseResult;

  GetCourseResultSuccessAction({@required this.courseResult});
}

class GetCourseResultFailureAction {}

// Update course result
class UpdateCourseResultAction {
  final String courseId;
  final CourseResultModel courseResult;

  UpdateCourseResultAction(
      {@required this.courseId, @required this.courseResult});
}

class UpdateCourseResultRequestAction {}

class UpdateCourseResultSuccessAction {
  final CourseResultModel courseResult;

  UpdateCourseResultSuccessAction({@required this.courseResult});
}

class UpdateCourseResultFailureAction {}

// Update lesson result
class UpdateLessonResultAction {
  final String courseId;
  final String lessonId;
  final LessonResultModel lessonResult;

  UpdateLessonResultAction(
      {@required this.courseId,
      @required this.lessonId,
      @required this.lessonResult});
}

class UpdateLessonResultRequestAction {}

class UpdateLessonResultSuccessAction {
  final LessonResultModel lessonResult;

  UpdateLessonResultSuccessAction({@required this.lessonResult});
}

class UpdateLessonResultFailureAction {}

// Update topic result
class UpdateTopicResultAction {
  final String courseId;
  final String lessonId;
  final String topicId;
  final TopicResultModel topicResult;

  UpdateTopicResultAction(
      {@required this.courseId,
      @required this.lessonId,
      @required this.topicId,
      @required this.topicResult});
}

class UpdateTopicResultRequestAction {}

class UpdateTopicResultSuccessAction {
  final String lessonId;
  final TopicResultModel topicResult;

  UpdateTopicResultSuccessAction(
      {@required this.lessonId, @required this.topicResult});
}

class UpdateTopicResultFailureAction {}
