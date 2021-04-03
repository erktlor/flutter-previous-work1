import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/generate_path.dart';
import 'package:flutter_web_app/widgets/custom_action_round_button/custom_action_round_button.dart';
import 'package:flutter_web_app/widgets/custom_checkmark/custom_checkmark.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';

class LessonsItem extends StatefulWidget {
  final CourseModel course;
  final LessonModel lesson;
  final bool checked;

  LessonsItem(
      {@required this.course, @required this.lesson, @required this.checked});

  @override
  _LessonsItemState createState() => _LessonsItemState();
}

class _LessonsItemState extends State<LessonsItem> {
  bool topicsOpened = false;

  openTopics() {
    setState(() {
      topicsOpened = true;
    });
  }

  closeTopics() {
    setState(() {
      topicsOpened = false;
    });
  }

  toggleTopicsOpened() {
    if (topicsOpened) {
      closeTopics();
    } else {
      openTopics();
    }
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final routeName = ModalRoute.of(context).settings.name;

      final topic = widget.lesson.topics.firstWhere(
          (element) => routeName.contains(element.id),
          orElse: () => null);

      if (topic != null) {
        openTopics();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final active =
        ModalRoute.of(context).settings.name.contains(widget.lesson.id);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              final path = generatePath(Routes.lesson,
                  {'courseId': widget.course.id, 'lessonId': widget.lesson.id});
              navigatorKey.currentState.pushNamed(path);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 1),
                    child: CustomCheckmark(
                      checked: widget.checked,
                      active: active,
                      size: CustomCheckmarkSize.small,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      widget.lesson.name,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight:
                              active ? FontWeight.w700 : FontWeight.w400,
                          color: active ? AppColors.gray3 : AppColors.gray21),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (widget.lesson.topics.length > 0)
            Container(
                margin: EdgeInsets.only(left: 30, top: 8), child: buildTopics())
        ],
      ),
    );
  }

  Widget buildTopics() {
    return Column(
      children: [
        CustomActionRoundButton(
            onTap: toggleTopicsOpened,
            child: Icon(
                topicsOpened ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 12,
                color: AppColors.white),
            label:
                '${widget.lesson.topics.length} Topic${widget.lesson.topics.length > 1 ? 's' : ''}'),
        Container(
          child:
              topicsOpened ? buildTopicsList(widget.lesson) : SizedBox.shrink(),
        )
      ],
    );
  }

  Widget buildTopicsList(LessonModel lesson) {
    return StoreConnector<ApplicationState, _LessonsItemProps>(
        builder: (context, props) {
          return Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 7),
              decoration: BoxDecoration(
                  color: AppColors.blue5,
                  borderRadius: BorderRadius.circular(6)),
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: lesson.topics.length,
                  itemBuilder: (context, index) {
                    final topic = lesson.topics.elementAt(index);
                    final active =
                        ModalRoute.of(context).settings.name.contains(topic.id);
                    final topicResult = props.courseResult != null
                        ? props.courseResult.getTopicResult(topic.id)
                        : null;
                    final checked = topicResult?.watched ?? false;

                    return GestureDetector(
                      onTap: () {
                        final path = generatePath(Routes.topic, {
                          'courseId': widget.course.id,
                          'lessonId': lesson.id,
                          'topicId': topic.id
                        });
                        navigatorKey.currentState.pushReplacementNamed(path);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomCheckmark(
                              size: CustomCheckmarkSize.small,
                              checked: checked,
                              active: active,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                                child: Text(topic.name,
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: active
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                        color: AppColors.gray22)))
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                        height: 10,
                      )));
        },
        converter: _LessonsItemProps.fromStore,
        distinct: true);
  }
}

class _LessonsItemProps extends Equatable {
  final CourseResultModel courseResult;

  _LessonsItemProps({@required this.courseResult});

  static _LessonsItemProps fromStore(Store<ApplicationState> store) {
    return _LessonsItemProps(courseResult: courseResultSelector(store.state));
  }

  @override
  List<Object> get props => [courseResult];
}
