import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/widgets/fixed_height_grid_item/fixed_height_grid_item.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/presenters/presenter_item/presenter_item.dart';

class PresentersContentMobile extends StatelessWidget {
  final List<PresenterModel> presenters;
  final bool loading;

  PresentersContentMobile({@required this.presenters, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavigationBar(),
          loading ? const LinearProgressIndicator() : buildGrid(context)
        ],
      ),
    );
  }

  Widget buildGrid(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;

    int crossAxisCount;

    if (screenWidth > 600) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 1;
    }

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(20),
      shrinkWrap: true,
      gridDelegate: FixedHeightGridItem(
          height: 260, crossAxisCount: crossAxisCount, crossAxisSpacing: 20),
      itemCount: presenters.length,
      itemBuilder: (_, int index) => Container(
          margin: EdgeInsets.only(bottom: 20),
          child: PresenterItem(presenter: presenters.elementAt(index))),
    );
  }
}
