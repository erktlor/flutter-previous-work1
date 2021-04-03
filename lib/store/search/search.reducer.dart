import 'package:flutter_web_app/store/search/search.actions.dart';
import 'package:flutter_web_app/store/search/search.types.dart';

SearchState searchReducer(SearchState state, action) {
  if (action is SearchContentAction) {
    return state.copyWith(searchContentItems: []);
  }

  if (action is SearchContentSuccessAction) {
    return state.copyWith(searchContentItems: action.searchContentItems);
  }

  if (action is ToggleSearchEnabledAction) {
    return state.copyWith(searchEnabled: !state.searchEnabled);
  }

  return state;
}
