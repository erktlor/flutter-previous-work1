import 'package:flutter_web_app/store/content_progress/content_progress.actions.dart';
import 'package:flutter_web_app/store/content_progress/content_progress.types.dart';

ContentProgressState contentProgressReducer(
    ContentProgressState state, action) {
  if (action is GetContentProgressSuccessAction ||
      action is UpdateContentProgressSuccessAction) {
    final Map<String, int> progressesCopy = {}..addAll(state.progresses);

    progressesCopy[action.contentUri] = action.seconds;

    return state.copyWith(progresses: progressesCopy);
  }

  return state;
}
