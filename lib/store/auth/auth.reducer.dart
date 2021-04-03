import 'package:flutter_web_app/store/auth/auth.actions.dart';
import 'package:flutter_web_app/store/auth/auth.types.dart';

AuthState authReducer(AuthState state, action) {
  if (action is LoginSuccessAction) {
    return state.copyWith(user: action.user);
  }

  return state;
}
