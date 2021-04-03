// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prospector.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProspectorState _$_$_ProspectorStateFromJson(Map<String, dynamic> json) {
  return _$_ProspectorState(
    callsDialed: json['callsDialed'] as int,
    callsReached: json['callsReached'] as int,
    appointments: json['appointments'] as int,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : ProspectorResultModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    settings: json['settings'] == null
        ? null
        : ProspectorSettingsModel.fromJson(
            json['settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ProspectorStateToJson(_$_ProspectorState instance) =>
    <String, dynamic>{
      'callsDialed': instance.callsDialed,
      'callsReached': instance.callsReached,
      'appointments': instance.appointments,
      'results': instance.results,
      'settings': instance.settings,
    };
