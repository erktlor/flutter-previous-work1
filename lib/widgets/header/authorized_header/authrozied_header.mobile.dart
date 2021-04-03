import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/constants/external_links.dart';
import 'package:flutter_web_app/common/constants/images.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:flutter_web_app/widgets/header/header.dart';

class AuthorizedHeaderMobile extends StatelessWidget {
  final VoidCallback onLogout;
  final VoidCallback onToggleSearch;
  final bool suspended;

  AuthorizedHeaderMobile(
      {@required this.onLogout,
      @required this.onToggleSearch,
      @required this.suspended});

  onSelected(String routeName) {
    if (routeName == 'logout') {
      onLogout();
    } else if (routeName == 'search') {
      onToggleSearch();
    } else if (routeName == 'faq') {
      openLink(ExternalLinks.faq);
    } else {
      navigatorKey.currentState.pushReplacementNamed(routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Header(
        getImageLogo: (_) => Images.darkHeaderLogo,
        buildLinks: (_) => Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: AppColors.black,
                    ),
                    onPressed: onToggleSearch),
                PopupMenuButton<String>(
                  tooltip: 'Menu',
                  onSelected: onSelected,
                  icon: Icon(Icons.menu, color: AppColors.green0),
                  itemBuilder: (context) => [
                    if (!suspended)
                      const PopupMenuItem(
                          child: Text('Home'), value: Routes.dashboard),
                    if (!suspended)
                      const PopupMenuItem(
                          child: Text('My Prospector'),
                          value: Routes.prospector),
                    if (!suspended)
                      const PopupMenuItem(child: Text('FAQ'), value: 'faq'),
                    if (!suspended)
                      const PopupMenuItem(
                          child: Text('Search'), value: 'search'),
                    const PopupMenuItem(
                        child: Text('My Details & Invoices'),
                        value: Routes.account),
                    if (!suspended)
                      const PopupMenuItem(
                          child: Text('Personal information'),
                          value: Routes.personalInformation),
                    const PopupMenuItem(child: Text('Logout'), value: 'logout'),
                  ],
                )
              ],
            ));
  }
}
