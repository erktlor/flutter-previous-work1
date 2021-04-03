import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/store/courses/courses.actions.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/course/course_content/course_content.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:redux/redux.dart';

class Course extends StatelessWidget {
  final String courseId;

  Course({@required this.courseId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _CourseProps>(
      onInitialBuild: (props) {
        props.getCourse(courseId);
        props.getCourseResult(courseId);
      },
      builder: (context, props) {
        return Scaffold(
          body: PageLayout(
            header: AuthorizedHeader(),
            child: props.course != null
                ? CourseContent(
                    course: props.course,
                  )
                : const LinearProgressIndicator(),
          ),
        );
      },
      converter: _CourseProps.fromStore,
      distinct: true,
    );
  }
}

class _CourseProps extends Equatable {
  final CourseModel course;
  final Function(String courseId) getCourse;
  final Function(String courseId) getCourseResult;

  _CourseProps(
      {@required this.course,
      @required this.getCourse,
      @required this.getCourseResult});

  static _CourseProps fromStore(Store<ApplicationState> store) {
    return _CourseProps(
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
