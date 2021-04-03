import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/models/lesson_result.model.dart';
import 'package:flutter_web_app/store/courses/courses.actions.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:flutter_web_app/widgets/favourite_page_header/favourite_page_header.dart';
import 'package:flutter_web_app/widgets/lesson/lesson_page/lesson_page_files.dart';
import 'package:flutter_web_app/widgets/lesson/lesson_page/lesson_page_progress.dart';
import 'package:flutter_web_app/widgets/lesson/lesson_page/lesson_page_video.dart';
import 'package:flutter_web_app/widgets/save_text_block/save_text_block.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';

import 'lesson_page_actions.dart';
import 'lesson_page_audio.dart';

class LessonPage extends StatelessWidget {
  final CourseModel course;
  final LessonModel lesson;

  LessonPage({@required this.course, @required this.lesson});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return StoreConnector<ApplicationState, _LessonPageProps>(
      builder: (context, props) {
        LessonResultModel lessonResult = props.courseResult != null
            ? props.courseResult.getLessonResult(lesson.id)
            : null;
        bool lessonFavorite = lessonResult?.favourite ?? false;

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FavouritePageHeader(
                title: lesson.name,
                date: DateTime.parse(lesson.publishedAt),
                favourite: lessonFavorite,
                onFavouriteChange: (bool newValue) => {
                  if (lessonResult != null)
                    props.updateLessonResult(course.id, lesson.id,
                        lessonResult.copyWith(favourite: newValue))
                },
                presenters: course.presenters,
                subjects: course.subjects,
              ),
              const SizedBox(
                height: 30,
              ),
              if (lessonResult != null)
                LessonPageProgress(
                    course: course, lesson: lesson, lessonResult: lessonResult),
              SizedBox(height: mobile ? 10 : 100),
              Container(
                padding: EdgeInsets.symmetric(horizontal: mobile ? 0 : 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (lesson.audioUri.isNotEmpty)
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: LessonPageAudio(lesson: lesson)),
                    if (lesson.videos.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: LessonPageVideo(lesson: lesson),
                      ),
                    if (lesson.files.length > 0)
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: LessonPageFiles(
                          lesson: lesson,
                        ),
                      ),
                    if (lesson.text.isNotEmpty)
                      HtmlWidget(
                        lesson.text,
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
              SizedBox(
                height: mobile ? 10 : 100,
              ),
              SaveTextBlock(
                  saving: props.updatingLessonResult,
                  value: lessonResult?.notes ?? '',
                  onSave: (String value) => {
                        if (lessonResult != null)
                          props.updateLessonResult(course.id, lesson.id,
                              lessonResult.copyWith(notes: value))
                      },
                  title: 'Notes',
                  placeholder: 'Write your notes here'),
              const SizedBox(
                height: 30,
              ),
              if (lessonResult != null)
                LessonPageActions(
                  course: course,
                  lesson: lesson,
                  lessonResult: lessonResult,
                  onComplete: () {
                    props.updateLessonResult(course.id, lesson.id,
                        lessonResult.copyWith(watched: true));
                  },
                )
            ],
          ),
        );
      },
      converter: _LessonPageProps.fromStore,
      distinct: true,
    );
  }
}

class _LessonPageProps extends Equatable {
  final CourseResultModel courseResult;
  final Function(String, String, LessonResultModel) updateLessonResult;
  final bool updatingLessonResult;

  _LessonPageProps(
      {@required this.courseResult,
      @required this.updateLessonResult,
      @required this.updatingLessonResult});

  static _LessonPageProps fromStore(Store<ApplicationState> store) {
    return _LessonPageProps(
        courseResult: courseResultSelector(store.state),
        updateLessonResult:
            (String courseId, String lessonId, LessonResultModel lessonResult) {
          store.dispatch(UpdateLessonResultAction(
              courseId: courseId,
              lessonId: lessonId,
              lessonResult: lessonResult));
        },
        updatingLessonResult: isUpdatingLessonResultSelector(store.state));
  }

  @override
  List<Object> get props => [courseResult, updatingLessonResult];
}
