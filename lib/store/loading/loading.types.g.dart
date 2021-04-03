// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoadingState _$_$_LoadingStateFromJson(Map<String, dynamic> json) {
  return _$_LoadingState(
    actions: (json['actions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    ),
  );
}

Map<String, dynamic> _$_$_LoadingStateToJson(_$_LoadingState instance) =>
    <String, dynamic>{
      'actions': instance.actions,
    };
