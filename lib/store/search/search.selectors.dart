import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/search/search.actions.dart';
import 'package:flutter_web_app/store/store.dart';

bool searchEnabledSelector(ApplicationState state) {
  return state.search.searchEnabled;
}

List<SearchContentModel> searchContentItemsSelector(ApplicationState state) {
  return state.search.searchContentItems;
}

bool isSearchingSelector(ApplicationState state) {
  return createLoadingSelector([SearchContentAction])(state);
}
