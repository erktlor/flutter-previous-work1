import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/label/label.dart';
import 'package:flutter_web_app/widgets/progress_line/progress_line.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';
import 'package:dart_date/dart_date.dart';

class CoursePageProgress extends StatelessWidget {
  final CourseModel course;

  CoursePageProgress({@required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray19,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Flex(
        direction: isMobile(context) ? Axis.vertical : Axis.horizontal,
        children: [
          isMobile(context)
              ? buildProgressLine()
              : Flexible(child: buildProgressLine()),
          const SizedBox(
            width: 15,
            height: 15,
          ),
          buildComplete(),
          const SizedBox(
            width: 15,
            height: 15,
          ),
          buildLastActivity(),
          const SizedBox(
            width: 15,
            height: 15,
          ),
          buildLabel()
        ],
      ),
    );
  }

  Widget buildProgressLine() {
    return StoreConnector<ApplicationState, _CoursePageProgress>(
        builder: (context, props) {
          double progress = props.courseResult?.progress ?? 0;

          return ProgressLine(
            progress: progress,
          );
        },
        converter: _CoursePageProgress.fromStore,
        distinct: true);
  }

  Widget buildComplete() {
    return StoreConnector<ApplicationState, _CoursePageProgress>(
        builder: (context, props) {
          String text = props.courseResult != null
              ? '${props.courseResult.progress * 100}% COMPLETE'
              : '';

          return Text(
            text,
            style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: AppColors.gray3),
          );
        },
        converter: _CoursePageProgress.fromStore,
        distinct: true);
  }

  Widget buildLastActivity() {
    return StoreConnector<ApplicationState, _CoursePageProgress>(
        builder: (context, props) {
          return Text(
              props.courseResult != null
                  ? 'Last activity on ${props.courseResult.lastActivity.format('MMMM dd, yyyy hh:mm a')}'
                  : '',
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray3));
        },
        converter: _CoursePageProgress.fromStore,
        distinct: true);
  }

  Widget buildLabel() {
    return StoreConnector<ApplicationState, _CoursePageProgress>(
        builder: (context, props) {
          String text = '';

          if (props.courseResult != null) {
            if (props.courseResult.progress == 1) {
              text = 'COMPLETED';
            } else {
              text = 'IN PROGRESS';
            }
          }

          return Label(text: text);
        },
        converter: _CoursePageProgress.fromStore,
        distinct: true);
  }
}

class _CoursePageProgress extends Equatable {
  final CourseResultModel courseResult;

  _CoursePageProgress({@required this.courseResult});

  static _CoursePageProgress fromStore(Store<ApplicationState> store) {
    return _CoursePageProgress(courseResult: courseResultSelector(store.state));
  }

  @override
  List<Object> get props => [courseResult];
}
