import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/store/courses/courses.actions.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/presenters_and_subjects_info/presenters_and_subjects_info.dart';
import 'package:flutter_web_app/widgets/selected_button/selected_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dart_date/dart_date.dart';
import 'package:redux/redux.dart';

class CoursePageHeader extends StatelessWidget {
  final CourseModel course;

  CoursePageHeader({@required this.course});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool showAsMobile = screenWidth < 1200;

    return Container(
        child: Flex(
      direction: showAsMobile ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.name,
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray3),
            ),
            buildInformation()
          ],
        ),
        showAsMobile
            ? const SizedBox(
                height: 10,
              )
            : const Spacer(),
        StoreConnector<ApplicationState, _CoursePageHeaderProps>(
          builder: (_, props) {
            bool favourite = props.courseResult?.favourite ?? false;

            return Row(
              children: [
                SelectedButton(
                  selected: favourite,
                  text: 'FAVOURITE',
                  onPressed: () => {
                    if (props.courseResult != null)
                      {
                        props.updateCourseResult(course.id,
                            props.courseResult.copyWith(favourite: !favourite))
                      }
                  },
                  icon: favourite
                      ? MaterialCommunityIcons.heart
                      : MaterialCommunityIcons.heart_outline,
                ),
              ],
            );
          },
          converter: _CoursePageHeaderProps.fromStore,
          distinct: true,
        )
      ],
    ));
  }

  buildInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(DateTime.parse(course.publishedAt).format('MMMM dd, yyyy'),
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    height: 1.8,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gray3)),
            const SizedBox(
              width: 5,
            ),
            PresentersAndSubjectsInfo(
                presenters: course.presenters,
                subjects: course.subjects,
                titleStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gray3),
                itemStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gray3))
          ],
        ),
      ],
    );
  }
}

class _CoursePageHeaderProps extends Equatable {
  final CourseResultModel courseResult;
  final Function(String courseId, CourseResultModel courseResult)
      updateCourseResult;

  _CoursePageHeaderProps(
      {@required this.courseResult, @required this.updateCourseResult});

  static _CoursePageHeaderProps fromStore(Store<ApplicationState> store) {
    return _CoursePageHeaderProps(
        courseResult: courseResultSelector(store.state),
        updateCourseResult: (String courseId, CourseResultModel courseResult) {
          store.dispatch(UpdateCourseResultAction(
              courseId: courseId, courseResult: courseResult));
        });
  }

  @override
  List<Object> get props => [courseResult];
}
