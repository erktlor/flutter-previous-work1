import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/models/avatar.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.actions.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.selectors.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetOnboardingSubjects({GetOnboardingSubjectsAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetOnboardingSubjectsRequestAction());

    final result = Result<Response>();

    yield Call(Api.getSubjects, result: result);

    List<SubjectModel> subjects = result.value.data
        .map<SubjectModel>((jsonItem) => SubjectModel.fromJson(jsonItem))
        .toList();

    yield Put(GetOnboardingSubjectsSuccessAction(subjects: subjects));
  }, Catch: (e, s) sync* {
    yield Put(GetOnboardingSubjectsFailureAction());
  });
}

_handleGetOnboardingAvatars({GetOnboardingAvatarsAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetOnboardingAvatarsRequestAction());

    final result = Result<Response>();

    yield Call(Api.getAvatars, result: result);

    List<AvatarModel> avatars = result.value.data
        .map<AvatarModel>((jsonItem) => AvatarModel.fromJson(jsonItem))
        .toList();

    yield Put(GetOnboardingAvatarsSuccessAction(avatars: avatars));
  }, Catch: (e, s) sync* {
    yield Put(GetOnboardingAvatarsFailureAction());
  });
}

_handleSaveOnboardingResults({SaveOnboardingResultsAction action}) sync* {
  final selectedSubjectsResult = Result<List<SubjectModel>>();
  yield Select(
      selector: onboardingSelectedSubjectsSelector,
      result: selectedSubjectsResult);

  final selectedAvatarResult = Result<AvatarModel>();
  yield Select(
      selector: onboardingSelectedAvatarSelector, result: selectedAvatarResult);

  yield Try(() sync* {
    yield Put(SaveOnboardingResultsRequestAction());

    final result = Result<Response>();

    final subjectsIds = selectedSubjectsResult.value
        .map<String>((subject) => subject.id)
        .toList();
    final avatarId = selectedAvatarResult.value.id;

    yield Call(Api.saveOnboardingResults,
        args: [subjectsIds, avatarId], result: result);

    navigatorKey.currentState.pushReplacementNamed(Routes.dashboard);

    yield Put(SaveOnboardingResultsSuccessAction());
  }, Catch: (e, s) sync* {
    yield Put(SaveOnboardingResultsFailureAction());
  });
}

_handleGetOnboardingResults({GetOnboardingResultsAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetOnboardingResultsRequestAction());

    final result = Result<Response>();

    yield Call(Api.getOnboardingResults, result: result);

    List<SubjectModel> subjects = result.value.data['subjects']
        .map<SubjectModel>((jsonItem) => SubjectModel.fromJson(jsonItem))
        .toList();
    AvatarModel avatar = AvatarModel.fromJson(result.value.data['avatar']);

    yield Put(
        GetOnboardingResultsSuccessAction(subjects: subjects, avatar: avatar));
  }, Catch: (e, s) sync* {
    print(e);
    yield Put(GetOnboardingResultsFailureAction());
  });
}

_watchGetOnboardingSubjects() sync* {
  yield TakeLeading(_handleGetOnboardingSubjects,
      pattern: GetOnboardingSubjectsAction);
}

_watchGetOnboardingAvatars() sync* {
  yield TakeLeading(_handleGetOnboardingAvatars,
      pattern: GetOnboardingAvatarsAction);
}

_watchSaveOnboardingResults() sync* {
  yield TakeLeading(_handleSaveOnboardingResults,
      pattern: SaveOnboardingResultsAction);
}

_watchGetOnboardingResults() sync* {
  yield TakeLeading(_handleGetOnboardingResults,
      pattern: GetOnboardingResultsAction);
}

onboardingSaga() sync* {
  yield Fork(_watchGetOnboardingSubjects);
  yield Fork(_watchGetOnboardingAvatars);
  yield Fork(_watchSaveOnboardingResults);
  yield Fork(_watchGetOnboardingResults);
}
