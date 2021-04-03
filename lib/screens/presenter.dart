import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/store/search/search.actions.dart';
import 'package:flutter_web_app/store/search/search.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:flutter_web_app/widgets/search/search_content/search_content.dart';
import 'package:redux/redux.dart';

class Presenter extends StatelessWidget {
  final String presenterId;

  Presenter({@required this.presenterId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _PresenterProps>(
      onInitialBuild: (props) {
        props.search(presenterId);
      },
      builder: (context, props) {
        return Scaffold(
          body: PageLayout(
            header: AuthorizedHeader(),
            child: SearchContent(
              title: 'Presenter content',
              loading: props.isSearching,
              searchContentItems: props.searchItems,
            ),
          ),
        );
      },
      converter: _PresenterProps.fromStore,
      distinct: true,
    );
  }
}

class _PresenterProps extends Equatable {
  final List<SearchContentModel> searchItems;
  final bool isSearching;
  final Function(String) search;

  _PresenterProps(
      {@required this.searchItems,
      @required this.isSearching,
      @required this.search});

  static _PresenterProps fromStore(Store<ApplicationState> store) {
    return _PresenterProps(
        searchItems: searchContentItemsSelector(store.state),
        isSearching: isSearchingSelector(store.state),
        search: (String presenterId) {
          store.dispatch(SearchContentAction(presenterId: presenterId));
        });
  }

  @override
  List<Object> get props => [searchItems, isSearching];
}
