// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DashboardState _$_$_DashboardStateFromJson(Map<String, dynamic> json) {
  return _$_DashboardState(
    videos: (json['videos'] as List)
        ?.map((e) => e == null
            ? null
            : DashboardVideoModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_DashboardStateToJson(_$_DashboardState instance) =>
    <String, dynamic>{
      'videos': instance.videos,
    };
