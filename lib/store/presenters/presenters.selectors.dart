import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/presenters/presenters.actions.dart';
import 'package:flutter_web_app/store/store.dart';

List<PresenterModel> presentersSelector(ApplicationState state) {
  return state.presenters.presenters;
}

bool isFetchingPresentersSelector(ApplicationState state) {
  return createLoadingSelector([GetPresentersAction])(state);
}
