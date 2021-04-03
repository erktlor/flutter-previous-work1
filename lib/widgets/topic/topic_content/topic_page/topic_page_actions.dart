import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/models/topic.model.dart';
import 'package:flutter_web_app/common/models/topic_result.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/utils/generate_path.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/custom_action_button/custom_action_button.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicPageActions extends StatelessWidget {
  final CourseModel course;
  final LessonModel lesson;
  final TopicModel topic;
  final TopicResultModel topicResult;
  final VoidCallback onComplete;

  TopicPageActions(
      {@required this.course,
      @required this.lesson,
      @required this.topic,
      @required this.topicResult,
      @required this.onComplete});

  void onTopicTap(TopicModel topic) {
    final path = generatePath(Routes.topic,
        {'courseId': course.id, 'lessonId': lesson.id, 'topicId': topic.id});
    navigatorKey.currentState.pushReplacementNamed(path);
  }

  @override
  Widget build(BuildContext context) {
    final nextTopic = lesson.getNextTopic(topic);
    final previousTopic = lesson.getPreviousTopic(topic);
    final mobile = isMobile(context);
    final flex = mobile ? 0 : 1;

    return Container(
      child: Flex(
        direction: mobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: flex,
            child: Row(
              mainAxisAlignment:
                  mobile ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Container(
                  child: previousTopic != null
                      ? CustomActionButton(
                          text: 'Previous topic',
                          onTap: () => onTopicTap(previousTopic),
                          iconPrepend: Icon(Icons.chevron_left,
                              color: AppColors.white, size: 18),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          if (mobile) const SizedBox(height: 10),
          Flexible(
            flex: flex,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      if (!topicResult.watched)
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: CustomActionButton(
                              text: 'Mark complete',
                              onTap: onComplete,
                              iconAppend: Icon(
                                Icons.check,
                                color: AppColors.white,
                                size: 18,
                              )),
                        ),
                      TextButton(
                        onPressed: () {
                          final path = generatePath(Routes.lesson,
                              {'courseId': course.id, 'lessonId': lesson.id});
                          navigatorKey.currentState.pushReplacementNamed(path);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Back to Lesson',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (mobile) const SizedBox(height: 10),
          Flexible(
            flex: flex,
            child: Row(
              mainAxisAlignment:
                  mobile ? MainAxisAlignment.center : MainAxisAlignment.end,
              children: [
                Container(
                  child: nextTopic != null
                      ? CustomActionButton(
                          text: 'Next topic',
                          onTap: () => onTopicTap(nextTopic),
                          iconAppend: Icon(Icons.chevron_right,
                              color: AppColors.white, size: 18))
                      : Container(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
