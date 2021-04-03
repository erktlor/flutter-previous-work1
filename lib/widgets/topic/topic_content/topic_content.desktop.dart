import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/models/topic.model.dart';
import 'package:flutter_web_app/widgets/course/course_lessons/course_lessons.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/topic/topic_content/topic_page/topic_page.dart';

class TopicContentDesktop extends StatelessWidget {
  final CourseModel course;
  final LessonModel lesson;
  final TopicModel topic;

  TopicContentDesktop({
    @required this.course,
    @required this.lesson,
    @required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(color: AppColors.gray11, width: 1))),
              child: TopicPage(
                course: course,
                lesson: lesson,
                topic: topic,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                  width: 400,
                  margin: EdgeInsets.only(top: 45),
                  child: CourseLessons(course: course)),
              NavigationBar()
            ],
          )
        ],
      ),
    );
  }
}
