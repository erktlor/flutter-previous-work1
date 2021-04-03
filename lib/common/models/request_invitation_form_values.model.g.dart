// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_invitation_form_values.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestInvitationFormValuesModel _$RequestInvitationFormValuesModelFromJson(
    Map<String, dynamic> json) {
  return RequestInvitationFormValuesModel(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    smsNumber: json['smsNumber'] as String,
  );
}

Map<String, dynamic> _$RequestInvitationFormValuesModelToJson(
        RequestInvitationFormValuesModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'smsNumber': instance.smsNumber,
    };
