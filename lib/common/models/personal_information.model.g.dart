// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_information.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInformationModel _$PersonalInformationModelFromJson(
    Map<String, dynamic> json) {
  return PersonalInformationModel(
    company: json['company'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    smsNumber: json['smsNumber'] as String,
    firstAddress: json['firstAddress'] as String,
    secondAddress: json['secondAddress'] as String,
    city: json['city'] as String,
    postCode: json['postCode'] as String,
    state: json['state'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$PersonalInformationModelToJson(
        PersonalInformationModel instance) =>
    <String, dynamic>{
      'company': instance.company,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'smsNumber': instance.smsNumber,
      'firstAddress': instance.firstAddress,
      'secondAddress': instance.secondAddress,
      'city': instance.city,
      'postCode': instance.postCode,
      'state': instance.state,
      'country': instance.country,
    };
