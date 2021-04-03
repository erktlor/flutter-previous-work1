// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) {
  return SubscriptionModel(
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    paymentsRemaining: json['paymentsRemaining'] as String,
    nextPaymentAmount: json['nextPaymentAmount'] as String,
    nextPaymentDate: json['nextPaymentDate'] as String,
    signupDate: json['signupDate'] as String,
  );
}

Map<String, dynamic> _$SubscriptionModelToJson(SubscriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'paymentsRemaining': instance.paymentsRemaining,
      'nextPaymentAmount': instance.nextPaymentAmount,
      'nextPaymentDate': instance.nextPaymentDate,
      'signupDate': instance.signupDate,
    };
