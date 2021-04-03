import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/personal_information/personal_information_page/personal_information_page.dart';

class PersonalInformationContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: PersonalInformationPage(),
          )),
          NavigationBar(),
        ],
      ),
    );
  }
}
