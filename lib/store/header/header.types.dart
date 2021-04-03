import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'header.types.freezed.dart';
part 'header.types.g.dart';

@freezed
abstract class HeaderState with _$HeaderState {
  const factory HeaderState({@required bool scrolled}) = _HeaderState;

  factory HeaderState.initialState() => HeaderState(scrolled: false);

  factory HeaderState.fromJson(Map<String, dynamic> json) =>
      _$HeaderStateFromJson(json);
}
