import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/widgets/course/course_lessons/course_lessons.dart';
import 'package:flutter_web_app/widgets/lesson/lesson_page/lesson_page.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';

class LessonContentMobile extends StatelessWidget {
  final CourseModel course;
  final LessonModel lesson;

  LessonContentMobile({@required this.course, @required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavigationBar(),
          Container(
            padding: const EdgeInsets.all(15),
            child: LessonPage(
              course: course,
              lesson: lesson,
            ),
          ),
          CourseLessons(course: course)
        ],
      ),
    );
  }
}
