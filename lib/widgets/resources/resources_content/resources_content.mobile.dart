import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/resource.model.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/resources/resources_list/resources_list.dart';

class ResourcesContentMobile extends StatelessWidget {
  final List<ResourceModel> resources;
  final bool loading;

  ResourcesContentMobile({@required this.resources, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavigationBar(),
          Container(
            padding: EdgeInsets.all(20),
            child: loading
                ? const LinearProgressIndicator()
                : ResourcesList(
                    resources: resources,
                  ),
          )
        ],
      ),
    );
  }
}
