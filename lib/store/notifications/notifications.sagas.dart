import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/store/notifications/notifications.actions.dart';
import 'package:redux_saga/redux_saga.dart';

class NotificationTypes {
  static final String interviewPublished = 'interview_published';
  static final String coursePublished = 'course_published';
  static final String podcastPublished = 'podcast_published';
}

_handleProcessNotificationOpened(
    {ProcessNotificationOpenedAction action}) sync* {
  if (action.type == NotificationTypes.interviewPublished) {
    final String interviewId = action.payload['id'];
    final path = Routes.interview + '?' + 'interviewId=${interviewId}';

    navigatorKey.currentState.pushReplacementNamed(path);
  } else if (action.type == NotificationTypes.coursePublished) {
    final String courseId = action.payload['id'];
    final path = Routes.course + '?' + 'courseId=${courseId}';

    navigatorKey.currentState.pushReplacementNamed(path);
  } else if (action.type == NotificationTypes.podcastPublished) {
    final String podcastId = action.payload['id'];
    final path = Routes.podcast + '?' + 'podcastId=${podcastId}';

    navigatorKey.currentState.pushReplacementNamed(path);
  }
}

_watchProcessNotificationOpened() sync* {
  yield TakeEvery(_handleProcessNotificationOpened,
      pattern: ProcessNotificationOpenedAction);
}

notificationsSaga() sync* {
  yield Fork(_watchProcessNotificationOpened);
}
