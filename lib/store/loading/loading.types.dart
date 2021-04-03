import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading.types.freezed.dart';
part 'loading.types.g.dart';

@freezed
abstract class LoadingState with _$LoadingState {
  const factory LoadingState({@required Map<String, bool> actions}) =
      _LoadingState;
  factory LoadingState.initialState() => LoadingState(actions: {});

  factory LoadingState.fromJson(Map<String, dynamic> json) =>
      _$LoadingStateFromJson(json);
}
