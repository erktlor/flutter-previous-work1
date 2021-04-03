import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/widgets/course/course_lessons/course_lessons.dart';
import 'package:flutter_web_app/widgets/course/course_page/course_page.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';

class CourseContentMobile extends StatelessWidget {
  final CourseModel course;

  CourseContentMobile({@required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavigationBar(),
          Container(
            padding: const EdgeInsets.all(15),
            child: CoursePage(
              course: course,
            ),
          ),
          CourseLessons(course: course)
        ],
      ),
    );
  }
}
