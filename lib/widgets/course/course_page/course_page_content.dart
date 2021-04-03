import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import 'package:flutter_web_app/widgets/custom_checkmark/custom_checkmark.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';

class CoursePageContent extends StatelessWidget {
  final CourseModel course;

  CoursePageContent({@required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          const SizedBox(
            height: 25,
          ),
          buildList()
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      'Course Content',
      style: GoogleFonts.poppins(
          fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.gray3),
    );
  }

  Widget buildList() {
    return StoreConnector<ApplicationState, _CoursePageContent>(
        builder: (context, props) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                LessonModel lesson = course.lessons.elementAt(index);
                bool checked = props.courseResult != null
                    ? props.courseResult.isLessonWatched(lesson)
                    : false;

                return buildItem(lesson, checked);
              },
              separatorBuilder: (_, __) => const SizedBox(
                    height: 10,
                  ),
              itemCount: course.lessons.length);
        },
        converter: _CoursePageContent.fromStore,
        distinct: true);
  }

  Widget buildItem(LessonModel lesson, bool checked) {
    return GestureDetector(
      onTap: () {
        final path = generatePath(
            Routes.lesson, {'courseId': course.id, 'lessonId': lesson.id});
        navigatorKey.currentState.pushNamed(path);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.white,
              border: Border.all(width: 2, color: AppColors.gray20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCheckmark(checked: checked),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  lesson.name,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray21),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CoursePageContent extends Equatable {
  final CourseResultModel courseResult;

  _CoursePageContent({@required this.courseResult});

  static _CoursePageContent fromStore(Store<ApplicationState> store) {
    return _CoursePageContent(courseResult: courseResultSelector(store.state));
  }

  @override
  List<Object> get props => [courseResult];
}
