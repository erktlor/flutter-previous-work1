import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/generate_path.dart';
import 'package:flutter_web_app/widgets/progress_line/progress_line.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';
import 'package:dart_date/dart_date.dart';

class CourseLessonsProgress extends StatelessWidget {
  final CourseModel course;

  CourseLessonsProgress({@required this.course});

  onCourseHomeTap() {
    final path = generatePath(Routes.course, {'courseId': course.id});
    navigatorKey.currentState.pushReplacementNamed(path);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _CourseLessonsProgress>(
        builder: (context, props) {
          double progress = props.courseResult?.progress ?? 0;

          return Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 4, color: AppColors.gray20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressLine(
                  progress: progress,
                  backgroundColor: AppColors.gray20,
                ),
                const SizedBox(height: 10),
                Text(
                  '${progress * 100}% COMPLETE',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.gray3),
                ),
                Text(
                    props.courseResult != null
                        ? 'Last activity on ${props.courseResult.lastActivity.format('MMMM dd, yyyy hh:mm a')}'
                        : '',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray3)),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: onCourseHomeTap,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text('Course home',
                        style: GoogleFonts.poppins(
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray21)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          );
        },
        converter: _CourseLessonsProgress.fromStore,
        distinct: true);
  }
}

class _CourseLessonsProgress extends Equatable {
  final CourseResultModel courseResult;

  _CourseLessonsProgress({@required this.courseResult});

  static _CourseLessonsProgress fromStore(Store<ApplicationState> store) {
    return _CourseLessonsProgress(
        courseResult: courseResultSelector(store.state));
  }

  @override
  List<Object> get props => [courseResult];
}
