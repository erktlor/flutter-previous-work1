import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/store/search/search.actions.dart';
import 'package:redux_saga/redux_saga.dart';

_handleSearchContentAction({SearchContentAction action}) sync* {
  yield Try(() sync* {
    yield Put(SearchContentRequestAction());

    final result = Result<Response>();

    String params;

    if (action.query != null) {
      params = 'q=${action.query}';
    } else if (action.presenterId != null) {
      params = 'presenterId=${action.presenterId}';
    } else if (action.subjectId != null) {
      params = 'subjectId=${action.subjectId}';
    } else {
      params = '';
    }

    yield Call(Api.searchContent, args: [params], result: result);

    List<SearchContentModel> searchContentItems = result.value.data
        .map<SearchContentModel>(
            (jsonItem) => SearchContentModel.fromJson(jsonItem))
        .toList();

    yield Put(
        SearchContentSuccessAction(searchContentItems: searchContentItems));
  }, Catch: (e, s) sync* {
    yield Put(SearchContentFailureAction());
  });
}

_watchSearchContentAction() sync* {
  yield TakeLeading(_handleSearchContentAction, pattern: SearchContentAction);
}

searchSaga() sync* {
  yield Fork(_watchSearchContentAction);
}
