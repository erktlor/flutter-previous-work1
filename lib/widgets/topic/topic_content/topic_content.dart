import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/models/topic.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/topic/topic_content/topic_content.desktop.dart';
import 'package:flutter_web_app/widgets/topic/topic_content/topic_content.mobile.dart';

class TopicContent extends StatelessWidget {
  final CourseModel course;
  final LessonModel lesson;
  final TopicModel topic;

  TopicContent(
      {@required this.course, @required this.lesson, @required this.topic});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return mobile
        ? TopicContentMobile(
            course: course,
            lesson: lesson,
            topic: topic,
          )
        : TopicContentDesktop(course: course, lesson: lesson, topic: topic);
  }
}
