import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_information.model.g.dart';

@JsonSerializable()
class PersonalInformationModel {
  final String company;
  final String firstName;
  final String lastName;
  final String email;
  final String smsNumber;
  final String firstAddress;
  final String secondAddress;
  final String city;
  final String postCode;
  final String state;
  final String country;

  PersonalInformationModel({
    @required this.company,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.smsNumber,
    @required this.firstAddress,
    @required this.secondAddress,
    @required this.city,
    @required this.postCode,
    @required this.state,
    @required this.country,
  });

  factory PersonalInformationModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalInformationModelFromJson(json);
  Map<String, dynamic> toJson() => _$PersonalInformationModelToJson(this);
}
