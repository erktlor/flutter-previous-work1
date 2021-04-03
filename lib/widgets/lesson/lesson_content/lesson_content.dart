import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';

import 'lesson_content.desktop.dart';
import 'lesson_content.mobile.dart';

class LessonContent extends StatelessWidget {
  final CourseModel course;
  final LessonModel lesson;

  LessonContent({@required this.course, @required this.lesson});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return mobile
        ? LessonContentMobile(
            course: course,
            lesson: lesson,
          )
        : LessonContentDesktop(
            course: course,
            lesson: lesson,
          );
  }
}
