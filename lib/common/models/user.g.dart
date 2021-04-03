// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    token: json['token'] as String,
    suspended: json['suspended'] as bool,
    onboardingDone: json['onboardingDone'] as bool,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'token': instance.token,
      'suspended': instance.suspended,
      'onboardingDone': instance.onboardingDone,
    };
