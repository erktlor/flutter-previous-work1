import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/external_links.dart';
import 'package:flutter_web_app/common/constants/images.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:flutter_web_app/widgets/header/header.dart';
import 'package:flutter_web_app/widgets/header/header_desktop_link.dart';

class NotAuthorizedHeaderDesktop extends StatelessWidget {
  final HeaderDesktopLinkColor color;

  NotAuthorizedHeaderDesktop({@required this.color});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context).settings.name;

    return Header(
        getImageLogo: (bool scrolled) => scrolled
            ? Images.darkHeaderLogo
            : color == HeaderDesktopLinkColor.light
                ? Images.lightHeaderLogo
                : Images.darkHeaderLogo,
        buildLinks: (_) => Row(
              children: [
                HeaderDesktopLink(
                    color: color,
                    text: 'About Tom Panos',
                    active: false,
                    onPressed: () {
                      openLink(ExternalLinks.aboutTomPanos);
                    }),
                const SizedBox(width: 10),
                HeaderDesktopLink(
                    color: color,
                    text: 'Contact',
                    active: false,
                    onPressed: () {
                      openLink(ExternalLinks.contact);
                    }),
                const SizedBox(width: 10),
                HeaderDesktopLink(
                    color: color,
                    text: 'Login',
                    active: currentRoute == Routes.login,
                    onPressed: () {
                      navigatorKey.currentState
                          .pushReplacementNamed(Routes.login);
                    })
              ],
            ));
  }
}
