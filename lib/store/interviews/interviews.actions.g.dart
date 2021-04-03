// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interviews.actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInterviewsAction _$GetInterviewsActionFromJson(Map<String, dynamic> json) {
  return GetInterviewsAction(
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$GetInterviewsActionToJson(
        GetInterviewsAction instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

GetInterviewsSuccessAction _$GetInterviewsSuccessActionFromJson(
    Map<String, dynamic> json) {
  return GetInterviewsSuccessAction(
    interviews: (json['interviews'] as List)
        ?.map((e) => e == null
            ? null
            : SearchInterviewModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetInterviewsSuccessActionToJson(
        GetInterviewsSuccessAction instance) =>
    <String, dynamic>{
      'interviews': instance.interviews,
    };

GetInterviewAction _$GetInterviewActionFromJson(Map<String, dynamic> json) {
  return GetInterviewAction(
    interviewId: json['interviewId'] as String,
  );
}

Map<String, dynamic> _$GetInterviewActionToJson(GetInterviewAction instance) =>
    <String, dynamic>{
      'interviewId': instance.interviewId,
    };

GetInterviewSuccessAction _$GetInterviewSuccessActionFromJson(
    Map<String, dynamic> json) {
  return GetInterviewSuccessAction(
    interview: json['interview'] == null
        ? null
        : InterviewModel.fromJson(json['interview'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetInterviewSuccessActionToJson(
        GetInterviewSuccessAction instance) =>
    <String, dynamic>{
      'interview': instance.interview,
    };

GetInterviewResultAction _$GetInterviewResultActionFromJson(
    Map<String, dynamic> json) {
  return GetInterviewResultAction(
    interviewId: json['interviewId'] as String,
  );
}

Map<String, dynamic> _$GetInterviewResultActionToJson(
        GetInterviewResultAction instance) =>
    <String, dynamic>{
      'interviewId': instance.interviewId,
    };

GetInterviewResultSuccessAction _$GetInterviewResultSuccessActionFromJson(
    Map<String, dynamic> json) {
  return GetInterviewResultSuccessAction(
    interviewResult: json['interviewResult'] == null
        ? null
        : InterviewResultModel.fromJson(
            json['interviewResult'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetInterviewResultSuccessActionToJson(
        GetInterviewResultSuccessAction instance) =>
    <String, dynamic>{
      'interviewResult': instance.interviewResult,
    };

UpdateInterviewResultAction _$UpdateInterviewResultActionFromJson(
    Map<String, dynamic> json) {
  return UpdateInterviewResultAction(
    interviewId: json['interviewId'] as String,
    interviewResult: json['interviewResult'] == null
        ? null
        : InterviewResultModel.fromJson(
            json['interviewResult'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateInterviewResultActionToJson(
        UpdateInterviewResultAction instance) =>
    <String, dynamic>{
      'interviewId': instance.interviewId,
      'interviewResult': instance.interviewResult,
    };

UpdateInterviewResultSuccessAction _$UpdateInterviewResultSuccessActionFromJson(
    Map<String, dynamic> json) {
  return UpdateInterviewResultSuccessAction(
    interviewResult: json['interviewResult'] == null
        ? null
        : InterviewResultModel.fromJson(
            json['interviewResult'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateInterviewResultSuccessActionToJson(
        UpdateInterviewResultSuccessAction instance) =>
    <String, dynamic>{
      'interviewResult': instance.interviewResult,
    };

GetInterviewKickstartVisibilitySuccessAction
    _$GetInterviewKickstartVisibilitySuccessActionFromJson(
        Map<String, dynamic> json) {
  return GetInterviewKickstartVisibilitySuccessAction(
    visible: json['visible'] as bool,
  );
}

Map<String, dynamic> _$GetInterviewKickstartVisibilitySuccessActionToJson(
        GetInterviewKickstartVisibilitySuccessAction instance) =>
    <String, dynamic>{
      'visible': instance.visible,
    };
