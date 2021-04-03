// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interviews.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InterviewsState _$_$_InterviewsStateFromJson(Map<String, dynamic> json) {
  return _$_InterviewsState(
    interviews: (json['interviews'] as List)
        ?.map((e) => e == null
            ? null
            : SearchInterviewModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    interview: json['interview'] == null
        ? null
        : InterviewModel.fromJson(json['interview'] as Map<String, dynamic>),
    interviewResult: json['interviewResult'] == null
        ? null
        : InterviewResultModel.fromJson(
            json['interviewResult'] as Map<String, dynamic>),
    kickstartVisible: json['kickstartVisible'] as bool,
  );
}

Map<String, dynamic> _$_$_InterviewsStateToJson(_$_InterviewsState instance) =>
    <String, dynamic>{
      'interviews': instance.interviews,
      'interview': instance.interview,
      'interviewResult': instance.interviewResult,
      'kickstartVisible': instance.kickstartVisible,
    };
