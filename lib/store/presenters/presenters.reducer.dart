import 'package:flutter_web_app/store/presenters/presenters.actions.dart';
import 'package:flutter_web_app/store/presenters/presenters.types.dart';

PresentersState presentersReducer(PresentersState state, action) {
  if (action is GetPresentersSuccessAction) {
    return state.copyWith(presenters: action.presenters);
  }

  return state;
}
