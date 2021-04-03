import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app.types.freezed.dart';
part 'app.types.g.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({@required String title}) = _AppState;

  factory AppState.initialState() =>
      AppState(title: 'Tom Panos | Real Estate Gym');

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
