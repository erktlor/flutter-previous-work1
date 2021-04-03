import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/resource.model.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/resources/resources_list/resources_list.dart';

class ResourcesContentDesktop extends StatelessWidget {
  final List<ResourceModel> resources;
  final bool loading;

  ResourcesContentDesktop({@required this.resources, @required this.loading});

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
              child: loading
                  ? const LinearProgressIndicator()
                  : ResourcesList(
                      resources: resources,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
