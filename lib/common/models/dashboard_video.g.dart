// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardVideoModel _$DashboardVideoModelFromJson(Map<String, dynamic> json) {
  return DashboardVideoModel(
    name: json['name'] as String,
    videoUri: json['videoUri'] as String,
  );
}

Map<String, dynamic> _$DashboardVideoModelToJson(
        DashboardVideoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'videoUri': instance.videoUri,
    };
