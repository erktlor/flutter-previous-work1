import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/widgets/fixed_height_grid_item/fixed_height_grid_item.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/presenters/presenter_item/presenter_item.dart';

class PresentersContentDesktop extends StatelessWidget {
  final List<PresenterModel> presenters;
  final bool loading;

  PresentersContentDesktop({@required this.presenters, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBar(),
          Flexible(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: AppColors.gray11, width: 1))),
            child:
                loading ? const LinearProgressIndicator() : buildGrid(context),
          ))
        ],
      ),
    );
  }

  buildGrid(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;

    int crossAxisCount;

    if (screenWidth > 1200) {
      crossAxisCount = 4;
    } else if (screenWidth > 900) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 2;
    }

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: FixedHeightGridItem(
          height: 260, crossAxisCount: crossAxisCount, crossAxisSpacing: 20),
      itemCount: presenters.length,
      itemBuilder: (_, int index) {
        return Container(
            margin: EdgeInsets.all(10),
            child: PresenterItem(presenter: presenters.elementAt(index)));
      },
    );
  }
}
