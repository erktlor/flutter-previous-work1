import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.model.g.dart';

@JsonSerializable()
class SubscriptionModel {
  final String id;
  final String name;
  final String type;
  final String paymentsRemaining;
  final String nextPaymentAmount;
  final String nextPaymentDate;
  final String signupDate;

  SubscriptionModel({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.paymentsRemaining,
    @required this.nextPaymentAmount,
    @required this.nextPaymentDate,
    @required this.signupDate,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionModelToJson(this);
}
