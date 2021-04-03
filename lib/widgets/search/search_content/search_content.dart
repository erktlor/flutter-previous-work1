import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/search_list/viewed_filter.dart';
import 'package:flutter_web_app/widgets/search/search_content/search_content.desktop.dart';
import 'package:flutter_web_app/widgets/search/search_content/search_content.mobile.dart';

class SearchContent extends StatefulWidget {
  final String title;
  final List<SearchContentModel> searchContentItems;
  final bool loading;

  SearchContent(
      {@required this.title,
      @required this.searchContentItems,
      this.loading = false});

  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  String filterValue = ViewedFilter.showAll;

  onChange(String value) {
    setState(() {
      filterValue = value;
    });
  }

  get filteredItems {
    final items = widget.searchContentItems;

    if (filterValue == ViewedFilter.showAll) {
      return items;
    } else if (filterValue == ViewedFilter.viewed) {
      return items.where((item) => item.watched).toList();
    } else if (filterValue == ViewedFilter.notViewed) {
      return items.where((item) => !item.watched).toList();
    } else if (filterValue == ViewedFilter.favourite) {
      return items.where((item) => item.favourite).toList();
    }
  }

  get filterOptions {
    return [
      ViewedFilter.showAll,
      ViewedFilter.viewed,
      ViewedFilter.notViewed,
      ViewedFilter.favourite,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? SearchContentMobile(
            title: widget.title,
            items: filteredItems,
            filterValue: filterValue,
            filterOnChange: onChange,
            filterOptions: filterOptions,
            loading: widget.loading)
        : SearchContentDesktop(
            title: widget.title,
            items: filteredItems,
            filterValue: filterValue,
            filterOnChange: onChange,
            filterOptions: filterOptions,
            loading: widget.loading);
  }
}
