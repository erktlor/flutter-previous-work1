import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/models/topic.model.dart';
import 'package:flutter_web_app/store/courses/courses.actions.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:flutter_web_app/widgets/topic/topic_content/topic_content.dart';
import 'package:redux/redux.dart';

class Topic extends StatelessWidget {
  final String courseId;
  final String lessonId;
  final String topicId;

  Topic(
      {@required this.courseId,
      @required this.lessonId,
      @required this.topicId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _TopicProps>(
      onInitialBuild: (props) {
        props.getCourse(courseId);
        props.getCourseResult(courseId);
      },
      builder: (context, props) {
        LessonModel lesson =
            props.course != null ? props.course.getLessonById(lessonId) : null;

        TopicModel topic = lesson != null ? lesson.getTopicById(topicId) : null;

        return Scaffold(
          body: PageLayout(
            header: AuthorizedHeader(),
            child: topic != null
                ? TopicContent(
                    course: props.course, lesson: lesson, topic: topic)
                : const LinearProgressIndicator(),
          ),
        );
      },
      converter: _TopicProps.fromStore,
      distinct: true,
    );
  }
}

class _TopicProps extends Equatable {
  final CourseModel course;
  final Function(String courseId) getCourse;
  final Function(String courseId) getCourseResult;

  _TopicProps(
      {@required this.course,
      @required this.getCourse,
      @required this.getCourseResult});

  static _TopicProps fromStore(Store<ApplicationState> store) {
    return _TopicProps(
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
