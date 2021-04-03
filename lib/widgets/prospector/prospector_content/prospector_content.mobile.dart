import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/prospector/my_prospector/my_prospector.dart';

class ProspectorContentMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [NavigationBar(), MyProspector()],
      ),
    );
  }
}
