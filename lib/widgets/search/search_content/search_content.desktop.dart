import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/search_list/search_list.dart';
import 'package:flutter_web_app/widgets/search_list/search_list_header.dart';

class SearchContentDesktop extends StatelessWidget {
  final String title;
  final List<SearchContentModel> items;
  final String filterValue;
  final Function(String) filterOnChange;
  final List<String> filterOptions;
  final bool loading;

  SearchContentDesktop(
      {@required this.title,
      @required this.items,
      @required this.filterValue,
      @required this.filterOnChange,
      @required this.filterOptions,
      this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBar(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: AppColors.gray11, width: 1))),
              child: Column(
                children: [
                  SearchListHeader(
                    title: title,
                    totalCount: items.length,
                    filterValue: filterValue,
                    filterOnChange: filterOnChange,
                    filterOptions: filterOptions,
                  ),
                  const SizedBox(height: 35),
                  if (loading) LinearProgressIndicator(),
                  SearchList(
                    items: items,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
