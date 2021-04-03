import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/store/courses/courses.actions.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/lesson/lesson_content/lesson_content.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:redux/redux.dart';

class Lesson extends StatelessWidget {
  final String courseId;
  final String lessonId;

  Lesson({@required this.courseId, @required this.lessonId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _LessonProps>(
      onInitialBuild: (props) {
        props.getCourse(courseId);
        props.getCourseResult(courseId);
      },
      builder: (context, props) {
        LessonModel lesson =
            props.course != null ? props.course.getLessonById(lessonId) : null;

        return Scaffold(
          body: PageLayout(
            header: AuthorizedHeader(),
            child: lesson != null
                ? LessonContent(course: props.course, lesson: lesson)
                : const LinearProgressIndicator(),
          ),
        );
      },
      converter: _LessonProps.fromStore,
      distinct: true,
    );
  }
}

class _LessonProps extends Equatable {
  final CourseModel course;
  final Function(String courseId) getCourse;
  final Function(String courseId) getCourseResult;

  _LessonProps(
      {@required this.course,
      @required this.getCourse,
      @required this.getCourseResult});

  static _LessonProps fromStore(Store<ApplicationState> store) {
    return _LessonProps(
        course: courseSelector(store.state),
        getCourse: (String courseId) {
          store.dispatch(GetCourseAction(courseId: courseId));
        },
        getCourseResult: (String courseId) {
          store.dispatch(GetCourseResultAction(courseId: courseId));
        });
  }

  @override
  List<Object> get props => [course];
}
