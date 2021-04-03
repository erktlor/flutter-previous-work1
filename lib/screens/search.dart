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

class Search extends StatelessWidget {
  final String query;

  Search({@required this.query});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _SearchProps>(
      onInitialBuild: (props) {
        props.search(query);
      },
      builder: (context, props) {
        return Scaffold(
          body: PageLayout(
              header: AuthorizedHeader(),
              child: SearchContent(
                title: 'All Content',
                searchContentItems: props.searchContentItems,
                loading: props.isSearching,
              )),
        );
      },
      converter: _SearchProps.fromStore,
      distinct: true,
    );
  }
}

class _SearchProps extends Equatable {
  final List<SearchContentModel> searchContentItems;
  final bool isSearching;
  final Function(String) search;

  _SearchProps(
      {@required this.searchContentItems,
      @required this.isSearching,
      @required this.search});

  static _SearchProps fromStore(Store<ApplicationState> store) {
    return _SearchProps(
        searchContentItems: searchContentItemsSelector(store.state),
        isSearching: isSearchingSelector(store.state),
        search: (String query) {
          store.dispatch(SearchContentAction(query: query));
        });
  }

  @override
  List<Object> get props => [searchContentItems, isSearching];
}
