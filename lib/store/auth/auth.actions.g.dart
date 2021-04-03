// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestorePasswordAction _$RestorePasswordActionFromJson(
    Map<String, dynamic> json) {
  return RestorePasswordAction(
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$RestorePasswordActionToJson(
        RestorePasswordAction instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

GetInvitationAction _$GetInvitationActionFromJson(Map<String, dynamic> json) {
  return GetInvitationAction(
    values: json['values'] == null
        ? null
        : RequestInvitationFormValuesModel.fromJson(
            json['values'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetInvitationActionToJson(
        GetInvitationAction instance) =>
    <String, dynamic>{
      'values': instance.values,
    };

UpdatePasswordAction _$UpdatePasswordActionFromJson(Map<String, dynamic> json) {
  return UpdatePasswordAction(
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UpdatePasswordActionToJson(
        UpdatePasswordAction instance) =>
    <String, dynamic>{
      'password': instance.password,
    };
