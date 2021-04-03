import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/widgets/course/course_lessons/course_lessons_progress.dart';
import 'package:flutter_web_app/widgets/course/lessons_list/lessons_list.dart';

class CourseLessons extends StatelessWidget {
  final CourseModel course;

  CourseLessons({@required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CourseLessonsProgress(course: course),
            LessonsList(course: course)
          ],
        ));
  }
}
