import 'package:flutter_web_app/store/header/header.actions.dart';
import 'package:flutter_web_app/store/header/header.types.dart';

HeaderState headerReducer(HeaderState state, action) {
  if (action is SetHeaderScrolledAction) {
    return state.copyWith(scrolled: action.scrolled);
  }

  return state;
}
