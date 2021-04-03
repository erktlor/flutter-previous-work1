import 'package:flutter_web_app/store/store.dart';

Map<String, int> contentProgressesSelector(ApplicationState state) {
  return state.contentProgress.progresses;
}
