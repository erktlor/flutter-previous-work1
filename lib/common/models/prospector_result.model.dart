import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prospector_result.model.g.dart';

@JsonSerializable()
class ProspectorResultModel {
  final int seconds;
  final int callsDialed;
  final int callsReached;
  final int appointments;
  final String createdAt;

  ProspectorResultModel(
      {@required this.seconds,
      @required this.callsDialed,
      @required this.callsReached,
      @required this.appointments,
      @required this.createdAt});

  factory ProspectorResultModel.fromJson(Map<String, dynamic> json) =>
      _$ProspectorResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProspectorResultModelToJson(this);
}
