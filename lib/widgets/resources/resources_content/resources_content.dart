import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/resource.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';

import 'resources_content.desktop.dart';
import 'resources_content.mobile.dart';

class ResourcesContent extends StatelessWidget {
  final List<ResourceModel> resources;
  final bool loading;

  ResourcesContent({@required this.resources, @required this.loading});

  @override
  Widget build(BuildContext context) {
    bool mobile = isMobile(context);

    return mobile
        ? ResourcesContentMobile(resources: resources, loading: loading)
        : ResourcesContentDesktop(resources: resources, loading: loading);
  }
}
