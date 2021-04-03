import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/account/account_page/account_page.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';

class AccountContentDesktop extends StatelessWidget {
  final bool suspended;

  AccountContentDesktop({@required this.suspended});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: AccountPage(),
          )),
          if (!suspended) NavigationBar(),
        ],
      ),
    );
  }
}
