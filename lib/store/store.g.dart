// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicationState _$_$_ApplicationStateFromJson(Map<String, dynamic> json) {
  return _$_ApplicationState(
    loading: json['loading'] == null
        ? null
        : LoadingState.fromJson(json['loading'] as Map<String, dynamic>),
    app: json['app'] == null
        ? null
        : AppState.fromJson(json['app'] as Map<String, dynamic>),
    auth: json['auth'] == null
        ? null
        : AuthState.fromJson(json['auth'] as Map<String, dynamic>),
    header: json['header'] == null
        ? null
        : HeaderState.fromJson(json['header'] as Map<String, dynamic>),
    dashboard: json['dashboard'] == null
        ? null
        : DashboardState.fromJson(json['dashboard'] as Map<String, dynamic>),
    interviews: json['interviews'] == null
        ? null
        : InterviewsState.fromJson(json['interviews'] as Map<String, dynamic>),
    presenters: json['presenters'] == null
        ? null
        : PresentersState.fromJson(json['presenters'] as Map<String, dynamic>),
    prospector: json['prospector'] == null
        ? null
        : ProspectorState.fromJson(json['prospector'] as Map<String, dynamic>),
    resources: json['resources'] == null
        ? null
        : ResourcesState.fromJson(json['resources'] as Map<String, dynamic>),
    courses: json['courses'] == null
        ? null
        : CoursesState.fromJson(json['courses'] as Map<String, dynamic>),
    podcasts: json['podcasts'] == null
        ? null
        : PodcastsState.fromJson(json['podcasts'] as Map<String, dynamic>),
    subjects: json['subjects'] == null
        ? null
        : SubjectsState.fromJson(json['subjects'] as Map<String, dynamic>),
    search: json['search'] == null
        ? null
        : SearchState.fromJson(json['search'] as Map<String, dynamic>),
    notes: json['notes'] == null
        ? null
        : NotesState.fromJson(json['notes'] as Map<String, dynamic>),
    account: json['account'] == null
        ? null
        : AccountState.fromJson(json['account'] as Map<String, dynamic>),
    onboarding: json['onboarding'] == null
        ? null
        : OnboardingState.fromJson(json['onboarding'] as Map<String, dynamic>),
    contentProgress: json['contentProgress'] == null
        ? null
        : ContentProgressState.fromJson(
            json['contentProgress'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ApplicationStateToJson(
        _$_ApplicationState instance) =>
    <String, dynamic>{
      'loading': instance.loading,
      'app': instance.app,
      'auth': instance.auth,
      'header': instance.header,
      'dashboard': instance.dashboard,
      'interviews': instance.interviews,
      'presenters': instance.presenters,
      'prospector': instance.prospector,
      'resources': instance.resources,
      'courses': instance.courses,
      'podcasts': instance.podcasts,
      'subjects': instance.subjects,
      'search': instance.search,
      'notes': instance.notes,
      'account': instance.account,
      'onboarding': instance.onboarding,
      'contentProgress': instance.contentProgress,
    };
