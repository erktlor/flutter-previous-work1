import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/common/models/course_result.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/common/models/lesson_result.model.dart';
import 'package:flutter_web_app/common/models/topic.model.dart';
import 'package:flutter_web_app/common/models/topic_result.model.dart';
import 'package:flutter_web_app/store/courses/courses.actions.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:flutter_web_app/widgets/favourite_page_header/favourite_page_header.dart';
import 'package:flutter_web_app/widgets/topic/topic_content/topic_page/topic_page_actions.dart';
import 'package:flutter_web_app/widgets/topic/topic_content/topic_page/topic_page_downloads.dart';
import 'package:flutter_web_app/widgets/topic/topic_content/topic_page/topic_page_progress.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';

class TopicPage extends StatelessWidget {
  final CourseModel course;
  final LessonModel lesson;
  final TopicModel topic;

  TopicPage(
      {@required this.course, @required this.lesson, @required this.topic});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _TopicPageProps>(
      builder: (context, props) {
        TopicResultModel topicResult;
        LessonResultModel lessonResult;

        if (props.courseResult != null) {
          topicResult = props.courseResult.getTopicResult(topic.id);
          lessonResult = props.courseResult.getLessonResult(lesson.id);
        }

        bool topicFavorite = topicResult?.favourite ?? false;

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FavouritePageHeader(
                title: topic.name,
                date: DateTime.parse(course.publishedAt),
                favourite: topicFavorite,
                onFavouriteChange: (bool newValue) => {
                  if (topicResult != null)
                    props.updateTopicResult(course.id, lesson.id, topic.id,
                        topicResult.copyWith(favourite: newValue))
                },
                presenters: [],
                subjects: [],
              ),
              const SizedBox(
                height: 30,
              ),
              if (lessonResult != null && topicResult != null)
                TopicPageProgress(
                    course: course,
                    lesson: lesson,
                    topic: topic,
                    lessonResult: lessonResult,
                    topicResult: topicResult),
              const SizedBox(
                height: 30,
              ),
              if (topic.text.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: HtmlWidget(
                    topic.text,
                    onTapUrl: (url) {
                      openLink(url);
                    },
                    textStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray3),
                  ),
                ),
              if (topic.files.length > 0)
                Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: TopicPageDownloads(topic: topic)),
              if (topicResult != null)
                TopicPageActions(
                  course: course,
                  lesson: lesson,
                  topic: topic,
                  topicResult: topicResult,
                  onComplete: () {
                    props.updateTopicResult(course.id, lesson.id, topic.id,
                        topicResult.copyWith(watched: true));
                  },
                )
            ],
          ),
        );
      },
      converter: _TopicPageProps.fromStore,
      distinct: true,
    );
  }
}

class _TopicPageProps extends Equatable {
  final CourseResultModel courseResult;
  final Function(String, String, String, TopicResultModel) updateTopicResult;

  _TopicPageProps(
      {@required this.courseResult, @required this.updateTopicResult});

  static _TopicPageProps fromStore(Store<ApplicationState> store) {
    return _TopicPageProps(
        courseResult: courseResultSelector(store.state),
        updateTopicResult: (String courseId, String lessonId, String topicId,
            TopicResultModel topicResult) {
          store.dispatch(UpdateTopicResultAction(
              courseId: courseId,
              lessonId: lessonId,
              topicId: topicId,
              topicResult: topicResult));
        });
  }

  @override
  List<Object> get props => [courseResult];
}
