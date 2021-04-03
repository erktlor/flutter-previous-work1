import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/common/models/subjects_content_count.model.dart';
import 'package:flutter_web_app/store/search/search.actions.dart';
import 'package:flutter_web_app/store/search/search.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/store/subjects/subjects.selectors.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:flutter_web_app/widgets/search/search_content/search_content.dart';
import 'package:redux/redux.dart';

class Subject extends StatelessWidget {
  final String subjectId;

  Subject({@required this.subjectId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _SubjectSearchProps>(
      onInitialBuild: (props) {
        props.search(subjectId);
      },
      builder: (context, props) {
        final subjectContentCount = props.subjectsContentCount.firstWhere(
            (element) => element.subject.id == subjectId,
            orElse: () => null);

        return Scaffold(
          body: PageLayout(
              header: AuthorizedHeader(),
              child: SearchContent(
                title: 'Subject ${subjectContentCount?.subject?.name ?? ''}',
                searchContentItems: props.searchItems,
                loading: props.isSearching,
              )),
        );
      },
      converter: _SubjectSearchProps.fromStore,
      distinct: true,
    );
  }
}

class _SubjectSearchProps extends Equatable {
  final List<SubjectsContentCountModel> subjectsContentCount;
  final List<SearchContentModel> searchItems;
  final bool isSearching;
  final Function(String) search;

  _SubjectSearchProps(
      {@required this.subjectsContentCount,
      @required this.searchItems,
      @required this.isSearching,
      @required this.search});

  static _SubjectSearchProps fromStore(Store<ApplicationState> store) {
    return _SubjectSearchProps(
        subjectsContentCount: subjectsContentCountSelector(store.state),
        searchItems: searchContentItemsSelector(store.state),
        isSearching: isSearchingSelector(store.state),
        search: (String subjectId) {
          store.dispatch(SearchContentAction(subjectId: subjectId));
        });
  }

  @override
  List<Object> get props => [subjectsContentCount, searchItems, isSearching];
}
