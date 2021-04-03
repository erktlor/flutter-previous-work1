import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/constants/external_links.dart';
import 'package:flutter_web_app/common/constants/images.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:flutter_web_app/widgets/header/header.dart';
import 'package:flutter_web_app/widgets/header/header_desktop_link.dart';

class NotAuthorizedHeaderMobile extends StatelessWidget {
  final HeaderDesktopLinkColor color;

  NotAuthorizedHeaderMobile({@required this.color});

  onSelected(context, String link) {
    if (link != null) {
      openLink(link);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Header(
        getImageLogo: (bool scrolled) => scrolled
            ? Images.darkHeaderLogo
            : color == HeaderDesktopLinkColor.light
                ? Images.lightHeaderLogo
                : Images.darkHeaderLogo,
        buildLinks: (_) => Row(
              children: [
                PopupMenuButton<String>(
                  tooltip: 'Menu',
                  onSelected: (value) => onSelected(context, value),
                  icon: Icon(Icons.menu, color: AppColors.green0),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Text('About Tom Panos'),
                        value: ExternalLinks.aboutTomPanos),
                    PopupMenuItem(
                        child: Text('Contact'), value: ExternalLinks.contact),
                    PopupMenuItem(child: Text('Log in'), value: null)
                  ],
                )
              ],
            ));
  }
}
