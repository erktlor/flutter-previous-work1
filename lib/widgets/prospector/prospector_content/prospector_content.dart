import 'package:flutter/material.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/prospector/prospector_content/prospector_content.desktop.dart';
import 'package:flutter_web_app/widgets/prospector/prospector_content/prospector_content.mobile.dart';

class ProspectorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return mobile ? ProspectorContentMobile() : ProspectorContentDesktop();
  }
}
