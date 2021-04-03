import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/screens/account.dart';
import 'package:flutter_web_app/screens/cancelled.dart';
import 'package:flutter_web_app/screens/course.dart';
import 'package:flutter_web_app/screens/interview.dart';
import 'package:flutter_web_app/screens/interviews.dart';
import 'package:flutter_web_app/screens/dashboard.dart';
import 'package:flutter_web_app/screens/lesson.dart';
import 'package:flutter_web_app/screens/login.dart';
import 'package:flutter_web_app/screens/notes.dart';
import 'package:flutter_web_app/screens/onboarding.dart';
import 'package:flutter_web_app/screens/personal_information.dart';
import 'package:flutter_web_app/screens/podcast.dart';
import 'package:flutter_web_app/screens/presenter.dart';
import 'package:flutter_web_app/screens/presenters.dart';
import 'package:flutter_web_app/screens/prospector.dart';
import 'package:flutter_web_app/screens/resources.dart';
import 'package:flutter_web_app/screens/root.dart';
import 'package:flutter_web_app/screens/search.dart';
import 'package:flutter_web_app/screens/subject.dart';
import 'package:flutter_web_app/screens/thank_you.dart';
import 'package:flutter_web_app/screens/topic.dart';

Widget withAuth(BuildContext context, Widget page) {
  if (store.state.auth.user == null) {
    return Root();
  }

  if (store.state.auth.user.suspended) {
    return Account();
  }

  return SafeArea(child: page);
}

var rootHandler = Handler(handlerFunc: (context, params) {
  return Root();
});

var loginHandler = Handler(handlerFunc: (context, params) {
  if (apiClient.options.headers.containsKey('Authorization')) {
    return Root();
  }

  return Login();
});

var dashboardHandler = Handler(handlerFunc: (context, params) {
  return withAuth(context, Dashboard());
});

var interviewsHandler = Handler(handlerFunc: (context, params) {
  return withAuth(
      context,
      Interviews(
        type: params['type']?.first,
      ));
});

var interviewHandler = Handler(handlerFunc: (context, params) {
  return withAuth(
      context,
      Interview(
        interviewId: params['interviewId']?.first,
      ));
});

var presentersHandler = Handler(handlerFunc: (context, params) {
  return withAuth(context, Presenters());
});

var presenterHandler = Handler(handlerFunc: (context, params) {
  return withAuth(
      context,
      Presenter(
        presenterId: params['presenterId']?.first,
      ));
});

var subjectHandler = Handler(handlerFunc: (context, params) {
  return withAuth(
      context,
      Subject(
        subjectId: params['subjectId']?.first,
      ));
});

var prospectorHandler = Handler(handlerFunc: (context, params) {
  return withAuth(context, Prospector());
});

var resourcesHandler = Handler(handlerFunc: (context, params) {
  return withAuth(context, Resources());
});

var courseHandler = Handler(handlerFunc: (context, params) {
  return withAuth(
      context,
      Course(
        courseId: params['courseId']?.first,
      ));
});

var lessonHandler = Handler(handlerFunc: (context, params) {
  return withAuth(
      context,
      Lesson(
        courseId: params['courseId']?.first,
        lessonId: params['lessonId']?.first,
      ));
});

var topicHandler = Handler(handlerFunc: (context, params) {
  return withAuth(
      context,
      Topic(
        courseId: params['courseId']?.first,
        lessonId: params['lessonId']?.first,
        topicId: params['topicId']?.first,
      ));
});

var podcastHandler = Handler(handlerFunc: (context, params) {
  return withAuth(
      context,
      Podcast(
        podcastId: params['podcastId']?.first,
      ));
});

var searchHandler = Handler(handlerFunc: (context, params) {
  return withAuth(
      context,
      Search(
        query: params['query']?.first,
      ));
});

var notesHandler = Handler(handlerFunc: (context, params) {
  return withAuth(context, Notes());
});

var accountHandler = Handler(handlerFunc: (context, params) {
  return withAuth(context, Account());
});

var personalInformationHandler = Handler(handlerFunc: (context, params) {
  return withAuth(context, PersonalInformation());
});

var thankYouHandler = Handler(handlerFunc: (context, params) {
  return ThankYou();
});

var cancelledHandler = Handler(handlerFunc: (context, params) {
  return Cancelled();
});

var onboardingHandler = Handler(handlerFunc: (context, params) {
  return withAuth(context, Onboarding());
});
