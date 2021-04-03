// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthState _$_$_AuthStateFromJson(Map<String, dynamic> json) {
  return _$_AuthState(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AuthStateToJson(_$_AuthState instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
