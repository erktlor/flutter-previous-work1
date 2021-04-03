import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBarDesktop extends StatelessWidget {
  final List<NavigationBarItem> navItems;

  NavigationBarDesktop({@required this.navItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (NavigationBarItem item in navItems)
            _Accoredon(
                key: Key(item.title),
                title: item.title,
                route: item.route,
                opened: item.active,
                links: [
                  for (NavigationBarItem child in item.children)
                    _AccordeonLink(
                        active: child.active,
                        name: child.title,
                        onPress: () {
                          navigatorKey.currentState
                              .pushReplacementNamed(child.route);
                        }),
                ])
        ],
      ),
    );
  }
}

class _AccordeonLink {
  final String name;
  final VoidCallback onPress;
  final bool active;

  _AccordeonLink(
      {@required this.name, @required this.onPress, @required this.active});
}

class _Accoredon extends StatefulWidget {
  final String title;
  final String route;
  final List<_AccordeonLink> links;
  final bool opened;

  _Accoredon(
      {Key key,
      @required this.title,
      @required this.route,
      @required this.links,
      @required this.opened})
      : super(key: key);

  @override
  __AccoredonState createState() => __AccoredonState();
}

class __AccoredonState extends State<_Accoredon> {
  bool opened = false;

  @override
  void initState() {
    super.initState();

    if (widget.opened && widget.links.length > 0) {
      onTitlePressed();
    }
  }

  onTitlePressed() {
    if (widget.links.length > 0) {
      setState(() {
        opened = !opened;
      });
    } else {
      navigatorKey.currentState.pushReplacementNamed(widget.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTitle(),
            if (opened)
              for (final link in widget.links) renderLink(link)
          ],
        ));
  }

  renderLink(_AccordeonLink link) {
    return TextButton(
      child: Container(
        color: link.active ? AppColors.green0 : Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: Text(link.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray0)),
            ),
          ],
        ),
      ),
      onPressed: link.onPress,
    );
  }

  buildTitle() {
    return TextButton(
      onPressed: onTitlePressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: widget.opened ? FontWeight.w700 : FontWeight.w500,
                  color: AppColors.gray3),
            ),
            const Spacer(),
            if (widget.links.length > 0)
              Icon(
                opened ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: AppColors.gray3,
              )
          ],
        ),
      ),
    );
  }
}
