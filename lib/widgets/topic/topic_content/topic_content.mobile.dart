import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/models/topic.model.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/topic/topic_content/topic_page/topic_page.dart';

class TopicContentMobile extends StatelessWidget {
  final CourseModel course;
  final LessonModel lesson;
  final TopicModel topic;

  TopicContentMobile({
    @required this.course,
    @required this.lesson,
    @required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavigationBar(),
          Container(
            padding: const EdgeInsets.all(15),
            child: TopicPage(
              course: course,
              lesson: lesson,
              topic: topic,
            ),
          )
        ],
      ),
    );
  }
}
