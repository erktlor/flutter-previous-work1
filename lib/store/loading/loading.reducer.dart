import 'package:flutter_web_app/store/loading/loading.types.dart';

RegExp regExp = RegExp(r"(Request|Success|Failure)");

LoadingState loadingReducer(LoadingState state, action) {
  var actionType = action.runtimeType.toString();
  var matches = regExp.allMatches(actionType);

  if (matches.length == 0) {
    return state;
  }

  var requestState = matches.elementAt(0).group(0);
  var requestName = actionType.substring(0, actionType.indexOf(requestState));

  return state.copyWith(
      actions: Map<String, bool>()
        ..addAll(state.actions)
        ..addAll({requestName: requestState == 'Request'}));
}
