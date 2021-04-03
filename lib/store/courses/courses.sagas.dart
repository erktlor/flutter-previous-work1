import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/common/models/lesson_result.model.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/common/models/topic_result.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/store/courses/courses.actions.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/utils/generate_path.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetCourses({SearchCoursesAction action}) sync* {
  yield Try(() sync* {
    yield Put(SearchCoursesRequestAction());

    final result = Result<Response>();

    yield Call(Api.searchContent, args: ['type=course'], result: result);

    List<SearchContentModel> searchCourses = result.value.data
        .map<SearchContentModel>(
            (jsonData) => SearchContentModel.fromJson(jsonData))
        .toList();

    yield Put(SearchCoursesSuccessAction(searchCourses: searchCourses));
  }, Catch: (e, s) sync* {
    yield Put(GetCoursesFailureAction());
  });
}

_handleGetCourse({GetCourseAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetCourseRequestAction());

    final result = Result<Response>();

    yield Call(Api.getCourse, args: [action.courseId], result: result);

    yield Put(GetCourseSuccessAction(
        course: CourseModel.fromJson(result.value.data)));
  }, Catch: (e, s) sync* {
    if (e is DioError) {
      if (e.response.statusCode == 403) {
        navigatorKey.currentState.pushReplacementNamed(Routes.dashboard);
        toast('Course is not available');
      }
    }

    yield Put(GetCourseFailureAction());
  });
}

_handleGetCourseResult({GetCourseResultAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetCourseResultRequestAction());

    final result = Result<Response>();

    yield Call(Api.getCourseResult, args: [action.courseId], result: result);

    yield Put(GetCourseResultSuccessAction(
        courseResult: CourseResultModel.fromJson(result.value.data)));
  }, Catch: (e, s) sync* {
    yield Put(GetCourseResultFailureAction());
  });
}

_handleUpdateCourseResult({UpdateCourseResultAction action}) sync* {
  yield Try(() sync* {
    yield Put(UpdateCourseResultRequestAction());

    toast('Saving...');

    final result = Result<Response>();

    yield Call(Api.updateCourseResult,
        args: [action.courseId, action.courseResult.toJson()], result: result);

    yield Put(UpdateCourseResultSuccessAction(
        courseResult: CourseResultModel.fromJson(result.value.data)));

    toast('Saved');
  }, Catch: (e, s) sync* {
    yield Put(UpdateCourseResultFailureAction());
  });
}

_handleUpdateLessonResult({UpdateLessonResultAction action}) sync* {
  yield Try(() sync* {
    yield Put(UpdateLessonResultRequestAction());

    toast('Saving...');

    final lessonResultRes = Result<LessonResultModel>();
    yield Select(
        selector: lessonResultSelector(action.lessonId),
        result: lessonResultRes);

    final result = Result<Response>();

    yield Call(Api.updateLessonResult,
        args: [action.courseId, action.lessonId, action.lessonResult.toJson()],
        result: result);

    yield Put(UpdateLessonResultSuccessAction(
        lessonResult: LessonResultModel.fromJson(result.value.data)));

    if (!lessonResultRes.value.watched && action.lessonResult.watched) {
      final path = generatePath(Routes.course, {'courseId': action.courseId});
      navigatorKey.currentState.pushReplacementNamed(path);
    }

    toast('Saved');
  }, Catch: (e, s) sync* {
    yield Put(UpdateLessonResultFailureAction());
  });
}

_handleUpdateTopicResult({UpdateTopicResultAction action}) sync* {
  yield Try(() sync* {
    yield Put(UpdateTopicResultRequestAction());

    toast('Saving...');

    final lessonResultRes = Result<LessonResultModel>();
    yield Select(
        selector: lessonResultSelector(action.lessonId),
        result: lessonResultRes);

    final result = Result<Response>();

    yield Call(Api.updateTopicResult,
        args: [
          action.courseId,
          action.lessonId,
          action.topicId,
          action.topicResult.toJson()
        ],
        result: result);

    yield Put(UpdateTopicResultSuccessAction(
        topicResult: TopicResultModel.fromJson(result.value.data),
        lessonId: action.lessonId));

    toast('Saved');
  }, Catch: (e, s) sync* {
    yield Put(UpdateTopicResultFailureAction());
  });
}

_watchGetCourses() sync* {
  yield TakeLeading(_handleGetCourses, pattern: SearchCoursesAction);
}

_watchGetCourse() sync* {
  yield TakeLeading(_handleGetCourse, pattern: GetCourseAction);
}

_watchGetCourseResult() sync* {
  yield TakeLeading(_handleGetCourseResult, pattern: GetCourseResultAction);
}

_watchUpdateCourseResult() sync* {
  yield TakeLeading(_handleUpdateCourseResult,
      pattern: UpdateCourseResultAction);
}

_watchUpdateLessonResult() sync* {
  yield TakeLeading(_handleUpdateLessonResult,
      pattern: UpdateLessonResultAction);
}

_watchUpdateTopicResult() sync* {
  yield TakeLeading(_handleUpdateTopicResult, pattern: UpdateTopicResultAction);
}

coursesSaga() sync* {
  yield Fork(_watchGetCourses);
  yield Fork(_watchGetCourse);
  yield Fork(_watchGetCourseResult);
  yield Fork(_watchUpdateCourseResult);
  yield Fork(_watchUpdateLessonResult);
  yield Fork(_watchUpdateTopicResult);
}
