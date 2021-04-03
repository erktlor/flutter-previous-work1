import 'package:flutter/material.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/personal_information/personal_information_content/personal_information_content.desktop.dart';
import 'package:flutter_web_app/widgets/personal_information/personal_information_content/personal_information_content.mobile.dart';

class PersonalInformationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? PersonalInformationContentMobile()
        : PersonalInformationContentDesktop();
  }
}
