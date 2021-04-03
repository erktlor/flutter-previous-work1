import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/dashboard_video.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard.types.freezed.dart';
part 'dashboard.types.g.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({@required List<DashboardVideoModel> videos}) =
      _DashboardState;

  factory DashboardState.initialState() => DashboardState(videos: []);

  factory DashboardState.fromJson(Map<String, dynamic> json) =>
      _$DashboardStateFromJson(json);
}
