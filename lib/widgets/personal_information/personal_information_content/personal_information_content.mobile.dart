import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/personal_information/personal_information_page/personal_information_page.dart';

class PersonalInformationContentMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavigationBar(),
          Container(
            padding: const EdgeInsets.all(15),
            child: PersonalInformationPage(),
          )
        ],
      ),
    );
  }
}
