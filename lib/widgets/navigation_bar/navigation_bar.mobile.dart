import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBarMobile extends StatefulWidget {
  final List<NavigationBarItem> navItems;

  NavigationBarMobile({@required this.navItems});

  @override
  _NavigationBarMobileState createState() => _NavigationBarMobileState();
}

class _NavigationBarMobileState extends State<NavigationBarMobile> {
  NavigationBarItem selectedItem;

  @override
  void didUpdateWidget(covariant NavigationBarMobile oldWidget) {
    if (oldWidget.navItems != widget.navItems) {
      NavigationBarItem activeItem = widget.navItems
          .firstWhere((element) => element.active, orElse: () => null);

      if (activeItem != null) {
        setState(() {
          selectedItem = activeItem;
        });
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (NavigationBarItem item in widget.navItems)
                    buildMainItem(item)
                ],
              ),
            ),
          ),
          if (selectedItem != null &&
              selectedItem.children != null &&
              selectedItem.children.length > 0)
            Container(
                height: 60,
                color: AppColors.green0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (NavigationBarItem item in selectedItem.children)
                        buildSecondaryItem(item)
                    ],
                  ),
                ))
        ],
      ),
    );
  }

  Widget buildMainItem(NavigationBarItem item) {
    bool active = selectedItem?.title == item.title;

    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: active ? AppColors.green0 : Colors.transparent,
      child: InkWell(
        onTap: () {
          if (item.children != null && item.children.length > 0) {
            setState(() {
              selectedItem = item;
            });
          } else {
            navigatorKey.currentState.pushReplacementNamed(item.route);
          }
        },
        child: Center(
          child: Text(
            item.title,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: active ? AppColors.black : AppColors.white),
          ),
        ),
      ),
    );
  }

  Widget buildSecondaryItem(NavigationBarItem item) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: item.active ? AppColors.green0 : Colors.transparent,
      child: InkWell(
        onTap: () {
          navigatorKey.currentState.pushReplacementNamed(item.route);
        },
        child: Center(
          child: Text(
            item.title,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: item.active ? FontWeight.w700 : FontWeight.w500,
                color: AppColors.black),
          ),
        ),
      ),
    );
  }
}
