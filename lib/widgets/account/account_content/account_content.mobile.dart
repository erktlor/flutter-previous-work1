import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/account/account_page/account_page.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';

class AccountContentMobile extends StatelessWidget {
  final bool suspended;

  AccountContentMobile({@required this.suspended});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (!suspended) NavigationBar(),
          Container(
            padding: const EdgeInsets.all(15),
            child: AccountPage(),
          )
        ],
      ),
    );
  }
}
