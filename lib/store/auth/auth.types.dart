import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.types.freezed.dart';
part 'auth.types.g.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({User user}) = _AuthState;

  factory AuthState.initialState() => const AuthState(user: null);

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
