import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_video.g.dart';

@JsonSerializable()
class DashboardVideoModel {
  final String name;
  final String videoUri;

  DashboardVideoModel({@required this.name, @required this.videoUri});

  factory DashboardVideoModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardVideoModelFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardVideoModelToJson(this);
}
