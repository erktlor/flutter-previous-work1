import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/widgets/smart_video_component/smart_video_component.dart';

class LessonPageVideo extends StatelessWidget {
  final LessonModel lesson;

  LessonPageVideo({@required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SmartVideoComponent(
                videoUri: lesson.videos.elementAt(index));
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: lesson.videos.length),
    );
  }
}
