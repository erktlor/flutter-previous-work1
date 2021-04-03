import 'package:flutter/material.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/account/account_content/account_content.desktop.dart';
import 'package:flutter_web_app/widgets/account/account_content/account_content.mobile.dart';

class AccountContent extends StatelessWidget {
  final bool suspended;

  AccountContent({@required this.suspended});

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? AccountContentMobile(
            suspended: suspended,
          )
        : AccountContentDesktop(
            suspended: suspended,
          );
  }
}
