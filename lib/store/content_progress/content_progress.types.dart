import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_progress.types.freezed.dart';
part 'content_progress.types.g.dart';

@freezed
abstract class ContentProgressState with _$ContentProgressState {
  const factory ContentProgressState({
    @required Map<String, int> progresses,
  }) = _ContentProgressState;

  factory ContentProgressState.initialState() => ContentProgressState(
        progresses: {},
      );

  factory ContentProgressState.fromJson(Map<String, dynamic> json) =>
      _$ContentProgressStateFromJson(json);
}
