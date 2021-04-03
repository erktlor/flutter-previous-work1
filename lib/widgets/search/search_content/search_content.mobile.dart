import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/search_list/search_list.dart';
import 'package:flutter_web_app/widgets/search_list/search_list_header.dart';

class SearchContentMobile extends StatelessWidget {
  final String title;
  final List<SearchContentModel> items;
  final String filterValue;
  final Function(String) filterOnChange;
  final List<String> filterOptions;
  final bool loading;

  SearchContentMobile(
      {@required this.title,
      @required this.items,
      @required this.filterValue,
      @required this.filterOnChange,
      @required this.filterOptions,
      this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavigationBar(),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchListHeader(
                  title: title,
                  totalCount: items.length,
                  filterValue: filterValue,
                  filterOnChange: filterOnChange,
                  filterOptions: filterOptions,
                ),
                const SizedBox(height: 20),
                if (loading) LinearProgressIndicator(),
                SearchList(
                  items: items,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
