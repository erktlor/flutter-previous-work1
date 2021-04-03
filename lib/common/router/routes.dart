import 'package:fluro/fluro.dart';

import 'route_handlers.dart';

class Routes {
  static const root = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const myProspector = '/my-prospector';
  static const interviews = '/interviews';
  static const interview = '/interview';
  static const presenters = '/presenters';
  static const presenter = '/presenter';
  static const prospector = '/prospector';
  static const resources = '/resources';
  static const course = '/course';
  static const lesson = '/lesson';
  static const topic = '/topic';
  static const podcast = '/podcast';
  static const subject = '/subject';
  static const search = '/search';
  static const notes = '/notes';
  static const account = '/account';
  static const personalInformation = '/personal-information';
  static const thankYou = '/thank-you';
  static const cancelled = '/cancelled';
  static const onboarding = '/onboarding';

  static void configureRoutes(FluroRouter router) {
    router.define(root,
        handler: rootHandler, transitionType: TransitionType.fadeIn);
    router.define(login,
        handler: loginHandler, transitionType: TransitionType.fadeIn);
    router.define(dashboard,
        handler: dashboardHandler, transitionType: TransitionType.fadeIn);
    router.define(interviews,
        handler: interviewsHandler, transitionType: TransitionType.fadeIn);
    router.define(interview,
        handler: interviewHandler, transitionType: TransitionType.fadeIn);
    router.define(presenters,
        handler: presentersHandler, transitionType: TransitionType.fadeIn);
    router.define(presenter,
        handler: presenterHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.prospector,
        handler: prospectorHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.resources,
        handler: resourcesHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.course,
        handler: courseHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.lesson,
        handler: lessonHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.topic,
        handler: topicHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.podcast,
        handler: podcastHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.subject,
        handler: subjectHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.search,
        handler: searchHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.notes,
        handler: notesHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.account,
        handler: accountHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.personalInformation,
        handler: personalInformationHandler,
        transitionType: TransitionType.fadeIn);
    router.define(Routes.thankYou,
        handler: thankYouHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.cancelled,
        handler: cancelledHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.onboarding,
        handler: onboardingHandler, transitionType: TransitionType.fadeIn);
  }
}
