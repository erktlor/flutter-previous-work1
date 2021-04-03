import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prospector_settings.model.g.dart';

@JsonSerializable()
class ProspectorSettingsModel {
  final int weeklyTarget;

  ProspectorSettingsModel({@required this.weeklyTarget});

  factory ProspectorSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$ProspectorSettingsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProspectorSettingsModelToJson(this);
}
