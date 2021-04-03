// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_progress.actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetContentProgressSuccessAction _$GetContentProgressSuccessActionFromJson(
    Map<String, dynamic> json) {
  return GetContentProgressSuccessAction(
    contentUri: json['contentUri'] as String,
    seconds: json['seconds'] as int,
  );
}

Map<String, dynamic> _$GetContentProgressSuccessActionToJson(
        GetContentProgressSuccessAction instance) =>
    <String, dynamic>{
      'contentUri': instance.contentUri,
      'seconds': instance.seconds,
    };

UpdateContentProgressSuccessAction _$UpdateContentProgressSuccessActionFromJson(
    Map<String, dynamic> json) {
  return UpdateContentProgressSuccessAction(
    contentUri: json['contentUri'] as String,
    seconds: json['seconds'] as int,
  );
}

Map<String, dynamic> _$UpdateContentProgressSuccessActionToJson(
        UpdateContentProgressSuccessAction instance) =>
    <String, dynamic>{
      'contentUri': instance.contentUri,
      'seconds': instance.seconds,
    };
