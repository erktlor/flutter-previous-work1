import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/course/lessons_list/lessons_item.dart';
import 'package:redux/redux.dart';

class LessonsList extends StatefulWidget {
  final CourseModel course;

  LessonsList({@required this.course});

  @override
  _LessonsListState createState() => _LessonsListState();
}

class _LessonsListState extends State<LessonsList> {
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

  onToggleTopicsOpened() {
    if (topicsOpened) {
      closeTopics();
    } else {
      openTopics();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _LessonsListProps>(
        builder: (context, props) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                LessonModel lesson = widget.course.lessons.elementAt(index);

                bool checked = props.courseResult != null
                    ? props.courseResult.isLessonWatched(lesson)
                    : false;

                return LessonsItem(
                    course: widget.course, lesson: lesson, checked: checked);
              },
              separatorBuilder: (_, __) => Container(
                    height: 1,
                    color: AppColors.gray20,
                  ),
              itemCount: widget.course.lessons.length);
        },
        converter: _LessonsListProps.fromStore,
        distinct: true);
  }
}

class _LessonsListProps extends Equatable {
  final CourseResultModel courseResult;

  _LessonsListProps({@required this.courseResult});

  static _LessonsListProps fromStore(Store<ApplicationState> store) {
    return _LessonsListProps(courseResult: courseResultSelector(store.state));
  }

  @override
  List<Object> get props => [courseResult];
}
