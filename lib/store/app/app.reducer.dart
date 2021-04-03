import 'package:flutter_web_app/store/app/app.actions.dart';
import 'package:flutter_web_app/store/app/app.types.dart';

AppState appReducer(AppState state, action) {
  if (action is SetAppTitleAction) {
    return state.copyWith(title: action.title);
  }

  return state;
}
