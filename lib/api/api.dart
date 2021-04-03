import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_app/common/constants/storage_keys.dart';
import 'package:flutter_web_app/common/models/user.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/store/auth/auth.actions.dart';
import 'package:flutter_web_app/utils/async_storage.dart';
import 'package:overlay_support/overlay_support.dart';

Dio apiClient = Dio();

class Api {
  static configure() async {
    apiClient.options.baseUrl = DotEnv().env['BASE_URL'];

    final authorizedUserStr =
        await AsyncStorage.getStringData(StorageKeys.authorizedUser);

    if (authorizedUserStr != null) {
      final authorizedUser = User.fromJson(jsonDecode(authorizedUserStr));
      setAuthorizationToken(authorizedUser.token);
      store.dispatch(LoginSuccessAction(user: authorizedUser));
    }

    apiClient.interceptors.add(InterceptorsWrapper(onError: (DioError e) async {
      if (e.response.statusCode == 401) {
        store.dispatch(LogoutAction());
        toast('Please login');
      }
    }));
  }

  static setAuthorizationToken(String token) {
    apiClient.options.headers = {'Authorization': token};
  }

  static clearToken() {
    apiClient.options.headers.remove('Authorization');
  }

  static login(email, password, deviceId) {
    return apiClient.post('/v1/auth/login',
        data: {"email": email, "password": password, "deviceId": deviceId});
  }

  static restorePassword(email) {
    return apiClient.post('/v1/auth/restore-password', data: {"email": email});
  }

  static updatePassword(String password) {
    return apiClient
        .post('/v1/auth/update-password', data: {"password": password});
  }

  static requestInvitation(data) {
    return apiClient.post('/v1/auth/request-invitation', data: data);
  }

  static getDashboardVideos() {
    return apiClient.get('/v1/dashboard/videos');
  }

  static getInterviews(String type) {
    return apiClient.get('/v1/member/interviews?type=$type');
  }

  static getInterview(String interviewId) {
    return apiClient.get('/v1/interviews/$interviewId');
  }

  static getInterviewResult(String interviewId) {
    return apiClient.get('/v1/interviews/$interviewId/result');
  }

  static updateInterviewResult(String interviewId, data) {
    return apiClient.put('/v1/interviews/$interviewId/result', data: data);
  }

  static getInterviewKickstartVisibility() {
    return apiClient.get('/v1/interviews/kickstart-visibility');
  }

  static getPresenters() {
    return apiClient.get('/v1/presenters');
  }

  static getProspectorResults() {
    return apiClient.get('/v1/prospector/results');
  }

  static getProspectorSettings() {
    return apiClient.get('/v1/prospector/settings');
  }

  static saveProspectorSettings(Map<String, int> body) {
    return apiClient.put('/v1/prospector/settings', data: body);
  }

  static saveProspectorResult(Map<String, int> body) {
    return apiClient.post('/v1/prospector/results', data: body);
  }

  static getProspectorCSVResults() {
    return apiClient.get('/v1/prospector/results/csv');
  }

  static getResources() {
    return apiClient.get('/v1/resources');
  }

  static getCourse(String courseId) {
    return apiClient.get('/v1/courses/$courseId');
  }

  static getCourseResult(String courseId) {
    return apiClient.get('/v1/courses/$courseId/result');
  }

  static updateCourseResult(String courseId, data) {
    return apiClient.put('/v1/courses/$courseId/result', data: data);
  }

  static updateLessonResult(String courseId, String lessonId, data) {
    return apiClient.put('/v1/courses/$courseId/lessons/$lessonId/result',
        data: data);
  }

  static updateTopicResult(
      String courseId, String lessonId, String topicId, data) {
    return apiClient.put(
        '/v1/courses/$courseId/lessons/$lessonId/topics/$topicId/result',
        data: data);
  }

  static getPodcast(String podcastId) {
    return apiClient.get('/v1/podcasts/$podcastId');
  }

  static getPodcastResult(String podcastId) {
    return apiClient.get('/v1/podcasts/$podcastId/result');
  }

  static updatePodcastResult(String podcastId, data) {
    return apiClient.put('/v1/podcasts/$podcastId/result', data: data);
  }

  static getSubjectsContentCount() {
    return apiClient.get('/v1/subjects/content/count');
  }

  static getSubjects() {
    return apiClient.get('/v1/subjects');
  }

  static getAvatars() {
    return apiClient.get('/v1/member/avatars');
  }

  static saveOnboardingResults(List<String> subjectsIds, String avatarId) {
    return apiClient.post('/v1/onboarding',
        data: {'subjectsIds': subjectsIds, 'avatarId': avatarId});
  }

  static getOnboardingResults() {
    return apiClient.get('/v1/onboarding');
  }

  static searchContent(String parameters) {
    return apiClient.get('/v1/search?$parameters');
  }

  static getNotes() {
    return apiClient.get('/v1/notes');
  }

  static getPaymentInformation() {
    return apiClient.get('/v1/account/payment-information');
  }

  static getPersonalInformation() {
    return apiClient.get('/v1/account/personal-information');
  }

  static updatePersonalInformation(data) {
    return apiClient.put('/v1/account/personal-information', data: data);
  }

  static resendInvoice(data) {
    return apiClient.post('/v1/account/resend-invoice', data: data);
  }

  static getContentProgress(String contentUri) {
    return apiClient.get(
        '/v1/content-progress?contentUri=${Uri.encodeComponent(contentUri)}');
  }

  static updateContentProgress(data) {
    return apiClient.put('/v1/content-progress', data: data);
  }
}
