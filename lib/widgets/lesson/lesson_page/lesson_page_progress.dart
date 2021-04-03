import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/models/lesson_result.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/utils/generate_path.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/label/label.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonPageProgress extends StatelessWidget {
  final CourseModel course;
  final LessonModel lesson;
  final LessonResultModel lessonResult;

  LessonPageProgress(
      {@required this.course,
      @required this.lesson,
      @required this.lessonResult});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      color: AppColors.gray19,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Flex(
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
      ],
    );
  }

  Widget buildLabel() {
    String text = '';

    if (lessonResult.watched) {
      text = 'COMPLETED';
    } else {
      text = 'IN PROGRESS';
    }

    return Label(text: text);
  }
}
