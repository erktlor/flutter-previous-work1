import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_invitation_form_values.model.g.dart';

@JsonSerializable()
class RequestInvitationFormValuesModel {
  final String firstName;
  final String lastName;
  final String email;
  final String smsNumber;

  RequestInvitationFormValuesModel({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.smsNumber,
  });

  factory RequestInvitationFormValuesModel.fromJson(
          Map<String, dynamic> json) =>
      _$RequestInvitationFormValuesModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RequestInvitationFormValuesModelToJson(this);
}
