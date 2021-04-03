import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/models/lesson_result.model.dart';
import 'package:flutter_web_app/common/models/topic.model.dart';
import 'package:flutter_web_app/common/models/topic_result.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/utils/generate_path.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/label/label.dart';
import 'package:flutter_web_app/widgets/progress_line/progress_line.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicPageProgress extends StatelessWidget {
  final CourseModel course;
  final LessonModel lesson;
  final TopicModel topic;
  final LessonResultModel lessonResult;
  final TopicResultModel topicResult;

  TopicPageProgress(
      {@required this.course,
      @required this.lesson,
      @required this.topic,
      @required this.lessonResult,
      @required this.topicResult});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      color: AppColors.gray19,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flex(
            direction: isMobile(context) ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(flex: mobile ? 0 : 1, child: buildBreadCrumbs(context)),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              buildLabel()
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          buildProgress()
        ],
      ),
    );
  }

  Widget buildBreadCrumbs(BuildContext context) {
    final style = GoogleFonts.poppins(
        fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.gray3);

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            final path = generatePath(Routes.course, {'courseId': course.id});
            navigatorKey.currentState.pushReplacementNamed(path);
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              course.name,
              style: style,
            ),
          ),
        ),
        Icon(
          Icons.chevron_right,
          size: 12,
        ),
        GestureDetector(
          onTap: () {
            final path = generatePath(
                Routes.lesson, {'courseId': course.id, 'lessonId': lesson.id});
            navigatorKey.currentState.pushReplacementNamed(path);
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              lesson.name,
              style: style,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Icon(
          Icons.chevron_right,
          size: 12,
        ),
        GestureDetector(
          onTap: () {
            final path = generatePath(Routes.topic, {
              'courseId': course.id,
              'lessonId': lesson.id,
              'topicId': topic.id
            });
            navigatorKey.currentState.pushReplacementNamed(path);
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              topic.name,
              style: style,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }

  Widget buildLabel() {
    String text = '';

    if (topicResult.watched) {
      text = 'COMPLETED';
    } else {
      text = 'IN PROGRESS';
    }

    return Label(text: text);
  }

  Widget buildProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'LESSON PROGRESS',
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w800),
            ),
            Text(
              '${lessonResult.progress * 100}% COMPLETE',
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ProgressLine(progress: lessonResult.progress)
      ],
    );
  }
}
