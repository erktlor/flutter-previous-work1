import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/store/courses/courses.actions.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:flutter_web_app/widgets/course/course_page/course_page_content.dart';
import 'package:flutter_web_app/widgets/course/course_page/course_page_header.dart';
import 'package:flutter_web_app/widgets/course/course_page/course_page_image_and_video.dart';
import 'package:flutter_web_app/widgets/course/course_page/course_page_progress.dart';
import 'package:flutter_web_app/widgets/custom_checkbox/custom_checkbox.dart';
import 'package:flutter_web_app/widgets/save_text_block/save_text_block.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';

class CoursePage extends StatelessWidget {
  final CourseModel course;

  CoursePage({@required this.course});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return StoreConnector<ApplicationState, _CoursePageProps>(
      builder: (context, props) {
        final notes = props.courseResult?.notes ?? '';
        final watched = props.courseResult?.watched ?? false;

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CoursePageHeader(course: course),
              SizedBox(
                height: mobile ? 30 : 60,
              ),
              CoursePageProgress(course: course),
              Container(
                padding: EdgeInsets.symmetric(horizontal: mobile ? 0 : 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    CoursePageImageAndVideo(course: course),
                    const SizedBox(
                      height: 10,
                    ),
                    if (course.text.isNotEmpty)
                      HtmlWidget(
                        course.text,
                        onTapUrl: (url) {
                          openLink(url);
                        },
                        textStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray3),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              CustomCheckbox(
                  value: watched,
                  onChange: (bool value) {
                    if (props.courseResult != null) {
                      props.updateCourseResult(course.id,
                          props.courseResult.copyWith(watched: !watched));
                    }
                  },
                  label: watched
                      ? 'Content viewed.'
                      : 'Tick this box if you have read/watched this content'),
              const SizedBox(height: 20),
              SaveTextBlock(
                  saving: props.updatingCourseResult,
                  value: notes,
                  onSave: (String value) {
                    if (props.courseResult != null) {
                      props.updateCourseResult(
                          course.id, props.courseResult.copyWith(notes: value));
                    }
                  },
                  title: 'Notes',
                  placeholder: 'Write your notes here'),
              const SizedBox(height: 15),
              CoursePageContent(course: course)
            ],
          ),
        );
      },
      converter: _CoursePageProps.fromStore,
      distinct: true,
    );
  }
}

class _CoursePageProps extends Equatable {
  final CourseResultModel courseResult;
  final Function(String courseId, CourseResultModel courseResult)
      updateCourseResult;
  final bool updatingCourseResult;

  _CoursePageProps(
      {@required this.courseResult,
      @required this.updateCourseResult,
      @required this.updatingCourseResult});

  static _CoursePageProps fromStore(Store<ApplicationState> store) {
    return _CoursePageProps(
        courseResult: courseResultSelector(store.state),
        updateCourseResult: (String courseId, CourseResultModel courseResult) {
          store.dispatch(UpdateCourseResultAction(
              courseId: courseId, courseResult: courseResult));
        },
        updatingCourseResult: isUpdatingCourseResultSelector(store.state));
  }

  @override
  List<Object> get props => [courseResult, updatingCourseResult];
}
