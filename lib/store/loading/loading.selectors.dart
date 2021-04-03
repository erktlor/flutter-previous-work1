import 'package:flutter_web_app/store/store.dart';

createLoadingSelector(List actions) {
  return (ApplicationState state) {
    var action = actions.firstWhere((action) {
      var actionType = action.toString();

      var actionString = actionType.substring(0, actionType.indexOf('Action'));

      return state.loading.actions[actionString] == true;
    }, orElse: () => null);

    return action != null;
  };
}
