import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/widgets/search_list/search_list_item.dart';

class SearchList extends StatelessWidget {
  final List<SearchContentModel> items;

  SearchList({@required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items.elementAt(index);

        return SearchListItem(searchContent: item);
      },
      separatorBuilder: (_, __) => const SizedBox(height: 20),
    );
  }
}
