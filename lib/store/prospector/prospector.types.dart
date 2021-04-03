import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/prospector_result.model.dart';
import 'package:flutter_web_app/common/models/prospector_settings.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prospector.types.freezed.dart';
part 'prospector.types.g.dart';

@freezed
abstract class ProspectorState with _$ProspectorState {
  const factory ProspectorState(
      {@required int callsDialed,
      @required int callsReached,
      @required int appointments,
      @required List<ProspectorResultModel> results,
      ProspectorSettingsModel settings}) = _ProspectorState;

  factory ProspectorState.initialState() => ProspectorState(
      callsDialed: 0,
      callsReached: 0,
      appointments: 0,
      results: [],
      settings: null);

  factory ProspectorState.fromJson(Map<String, dynamic> json) =>
      _$ProspectorStateFromJson(json);
}
