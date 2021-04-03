import 'package:flutter/material.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/account/account_page/my_account/onboarding_information.dart';
import 'package:flutter_web_app/widgets/account/account_page/my_account/payment_information.dart';

import '../account_section_separator.dart';
import 'change_password.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AccountSectionSeparator(text: 'My Account'),
          Container(
              padding: EdgeInsets.only(right: mobile ? 0 : 50),
              margin: const EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  PaymentInformation(),
                  const SizedBox(
                    height: 20,
                  ),
                  ChangePassword(),
                  const SizedBox(
                    height: 20,
                  ),
                  OnboardingInformation()
                ],
              )),
        ],
      ),
    );
  }
}
