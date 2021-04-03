import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/store/account/account.reducer.dart';
import 'package:flutter_web_app/store/account/account.sagas.dart';
import 'package:flutter_web_app/store/account/account.types.dart';
import 'package:flutter_web_app/store/app/app.reducer.dart';
import 'package:flutter_web_app/store/app/app.types.dart';
import 'package:flutter_web_app/store/auth/auth.actions.dart';
import 'package:flutter_web_app/store/auth/auth.reducer.dart';
import 'package:flutter_web_app/store/auth/auth.sagas.dart';
import 'package:flutter_web_app/store/auth/auth.types.dart';
import 'package:flutter_web_app/store/content_progress/content_progress.reducer.dart';
import 'package:flutter_web_app/store/content_progress/content_progress.sagas.dart';
import 'package:flutter_web_app/store/content_progress/content_progress.types.dart';
import 'package:flutter_web_app/store/courses/courses.reducer.dart';
import 'package:flutter_web_app/store/courses/courses.sagas.dart';
import 'package:flutter_web_app/store/courses/courses.types.dart';
import 'package:flutter_web_app/store/dashboard/dashboard.reducer.dart';
import 'package:flutter_web_app/store/dashboard/dashboard.sagas.dart';
import 'package:flutter_web_app/store/dashboard/dashboard.types.dart';
import 'package:flutter_web_app/store/header/header.reducer.dart';
import 'package:flutter_web_app/store/interviews/interviews.reducer.dart';
import 'package:flutter_web_app/store/interviews/interviews.sagas.dart';
import 'package:flutter_web_app/store/interviews/interviews.types.dart';
import 'package:flutter_web_app/store/loading/loading.reducer.dart';
import 'package:flutter_web_app/store/loading/loading.types.dart';
import 'package:flutter_web_app/store/notes/notes.reducer.dart';
import 'package:flutter_web_app/store/notes/notes.sagas.dart';
import 'package:flutter_web_app/store/notes/notes.types.dart';
import 'package:flutter_web_app/store/notifications/notifications.sagas.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.reducer.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.sagas.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.types.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.reducer.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.sagas.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.types.dart';
import 'package:flutter_web_app/store/presenters/presenters.reducer.dart';
import 'package:flutter_web_app/store/presenters/presenters.sagas.dart';
import 'package:flutter_web_app/store/presenters/presenters.types.dart';
import 'package:flutter_web_app/store/prospector/prospector.reducer.dart';
import 'package:flutter_web_app/store/prospector/prospector.sagas.dart';
import 'package:flutter_web_app/store/prospector/prospector.types.dart';
import 'package:flutter_web_app/store/resources/resources.reducer.dart';
import 'package:flutter_web_app/store/resources/resources.sagas.dart';
import 'package:flutter_web_app/store/resources/resources.types.dart';
import 'package:flutter_web_app/store/search/search.reducer.dart';
import 'package:flutter_web_app/store/search/search.sagas.dart';
import 'package:flutter_web_app/store/search/search.types.dart';
import 'package:flutter_web_app/store/subjects/subjects.reducer.dart';
import 'package:flutter_web_app/store/subjects/subjects.sagas.dart';
import 'package:flutter_web_app/store/subjects/subjects.types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redux_saga/redux_saga.dart';

import 'header/header.types.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
abstract class ApplicationState with _$ApplicationState {
  const factory ApplicationState({
    @required LoadingState loading,
    @required AppState app,
    @required AuthState auth,
    @required HeaderState header,
    @required DashboardState dashboard,
    @required InterviewsState interviews,
    @required PresentersState presenters,
    @required ProspectorState prospector,
    @required ResourcesState resources,
    @required CoursesState courses,
    @required PodcastsState podcasts,
    @required SubjectsState subjects,
    @required SearchState search,
    @required NotesState notes,
    @required AccountState account,
    @required OnboardingState onboarding,
    @required ContentProgressState contentProgress,
  }) = _ApplicationState;

  factory ApplicationState.initialState() => ApplicationState(
      loading: LoadingState.initialState(),
      app: AppState.initialState(),
      auth: AuthState.initialState(),
      header: HeaderState.initialState(),
      dashboard: DashboardState.initialState(),
      interviews: InterviewsState.initialState(),
      presenters: PresentersState.initialState(),
      prospector: ProspectorState.initialState(),
      resources: ResourcesState.initialState(),
      courses: CoursesState.initialState(),
      podcasts: PodcastsState.initialState(),
      subjects: SubjectsState.initialState(),
      search: SearchState.initialState(),
      notes: NotesState.initialState(),
      account: AccountState.initialState(),
      onboarding: OnboardingState.initialState(),
      contentProgress: ContentProgressState.initialState());

  factory ApplicationState.fromJson(Map<String, dynamic> json) =>
      _$ApplicationStateFromJson(json);
}

ApplicationState rootReducer(ApplicationState state, action) {
  if (action is LogoutAction) {
    return ApplicationState.initialState();
  }

  return ApplicationState(
      loading: loadingReducer(state.loading, action),
      app: appReducer(state.app, action),
      auth: authReducer(state.auth, action),
      header: headerReducer(state.header, action),
      dashboard: dashboardReducer(state.dashboard, action),
      interviews: interviewsReducer(state.interviews, action),
      presenters: presentersReducer(state.presenters, action),
      prospector: prospectorReducer(state.prospector, action),
      resources: resourcesReducer(state.resources, action),
      courses: coursesReducer(state.courses, action),
      podcasts: podcastsReducer(state.podcasts, action),
      subjects: subjectsReducer(state.subjects, action),
      search: searchReducer(state.search, action),
      notes: notesReducer(state.notes, action),
      account: accountReducer(state.account, action),
      onboarding: onboardingReducer(state.onboarding, action),
      contentProgress: contentProgressReducer(state.contentProgress, action));
}

rootSaga() sync* {
  yield Fork(authSaga);
  yield Fork(dashboardSaga);
  yield Fork(interviewsSaga);
  yield Fork(presentersSaga);
  yield Fork(prospectorSaga);
  yield Fork(resourcesSaga);
  yield Fork(coursesSaga);
  yield Fork(podcastsSaga);
  yield Fork(subjectsSaga);
  yield Fork(searchSaga);
  yield Fork(notesSaga);
  yield Fork(accountSaga);
  yield Fork(onboardingSaga);
  yield Fork(contentProgressSaga);
  yield Fork(notificationsSaga);
}
