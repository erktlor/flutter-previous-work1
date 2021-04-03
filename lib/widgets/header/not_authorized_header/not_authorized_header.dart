import 'package:flutter/material.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/header/header_desktop_link.dart';
import 'package:flutter_web_app/widgets/header/not_authorized_header/not_authorized_header.desktop.dart';
import 'package:flutter_web_app/widgets/header/not_authorized_header/not_authorized_header.mobile.dart';

class NotAuthorizedHeader extends StatelessWidget {
  final HeaderDesktopLinkColor color;

  NotAuthorizedHeader({this.color = HeaderDesktopLinkColor.light});

  @override
  Widget build(BuildContext context) {
    var mobile = isMobile(context);

    return mobile
        ? NotAuthorizedHeaderMobile(color: color)
        : NotAuthorizedHeaderDesktop(color: color);
  }
}
