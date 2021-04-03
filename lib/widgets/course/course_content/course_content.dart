import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/course/course_content/course_content.desktop.dart';
import 'package:flutter_web_app/widgets/course/course_content/course_content.mobile.dart';

class CourseContent extends StatelessWidget {
  final CourseModel course;

  CourseContent({@required this.course});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return mobile
        ? CourseContentMobile(
            course: course,
          )
        : CourseContentDesktop(
            course: course,
          );
  }
}
