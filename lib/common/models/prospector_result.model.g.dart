// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prospector_result.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProspectorResultModel _$ProspectorResultModelFromJson(
    Map<String, dynamic> json) {
  return ProspectorResultModel(
    seconds: json['seconds'] as int,
    callsDialed: json['callsDialed'] as int,
    callsReached: json['callsReached'] as int,
    appointments: json['appointments'] as int,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$ProspectorResultModelToJson(
        ProspectorResultModel instance) =>
    <String, dynamic>{
      'seconds': instance.seconds,
      'callsDialed': instance.callsDialed,
      'callsReached': instance.callsReached,
      'appointments': instance.appointments,
      'createdAt': instance.createdAt,
    };
