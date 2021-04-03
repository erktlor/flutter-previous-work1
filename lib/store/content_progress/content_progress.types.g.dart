// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_progress.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentProgressState _$_$_ContentProgressStateFromJson(
    Map<String, dynamic> json) {
  return _$_ContentProgressState(
    progresses: (json['progresses'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
  );
}

Map<String, dynamic> _$_$_ContentProgressStateToJson(
        _$_ContentProgressState instance) =>
    <String, dynamic>{
      'progresses': instance.progresses,
    };
