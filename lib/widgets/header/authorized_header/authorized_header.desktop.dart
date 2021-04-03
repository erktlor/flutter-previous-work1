import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/constants/external_links.dart';
import 'package:flutter_web_app/common/constants/images.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:flutter_web_app/widgets/header/header.dart';
import 'package:flutter_web_app/widgets/header/header_desktop_link.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';

class AuthorizedHeaderDesktop extends StatelessWidget {
  final VoidCallback onLogout;
  final VoidCallback onToggleSearch;
  final bool suspended;

  AuthorizedHeaderDesktop(
      {@required this.onLogout,
      @required this.onToggleSearch,
      @required this.suspended});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context).settings.name;

    return Header(
        getImageLogo: (_) => Images.darkHeaderLogo,
        buildLinks: (_) => Row(
              children: [
                if (!suspended)
                  HeaderDesktopLink(
                      text: 'Home',
                      active: currentRoute == Routes.dashboard,
                      onPressed: () {
                        navigatorKey.currentState
                            .pushReplacementNamed(Routes.dashboard);
                      }),
                const SizedBox(width: 10),
                if (!suspended)
                  HeaderDesktopLink(
                      text: 'My Prospector',
                      active: currentRoute == Routes.prospector,
                      onPressed: () {
                        navigatorKey.currentState
                            .pushReplacementNamed(Routes.prospector);
                      }),
                const SizedBox(width: 10),
                if (!suspended)
                  HeaderDesktopLink(
                      text: 'FAQ',
                      active: false,
                      onPressed: () {
                        openLink(ExternalLinks.faq);
                      }),
                const SizedBox(width: 10),
                Popover(
                    width: 240,
                    arrowHeight: 0,
                    contentDyOffset: 10,
                    barrierColor: Colors.transparent,
                    child: HeaderDesktopLink(
                        text: 'My Account',
                        active: currentRoute == Routes.account ||
                            currentRoute == Routes.personalInformation,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.black,
                        ),
                        onPressed: () {}),
                    bodyBuilder: (_) => Scrollbar(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border(
                                    top: BorderSide(
                                        width: 2, color: AppColors.green0))),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: TextButton(
                                      onPressed: () {
                                        navigatorKey.currentState
                                            .pushReplacementNamed(
                                                Routes.account);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                'My Details & Invoices',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    color: AppColors.gray3,
                                                    fontWeight: currentRoute ==
                                                            Routes.account
                                                        ? FontWeight.w600
                                                        : FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                if (!suspended)
                                  Container(
                                    width: double.infinity,
                                    child: TextButton(
                                        onPressed: () {
                                          navigatorKey.currentState
                                              .pushReplacementNamed(
                                                  Routes.personalInformation);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  'Update your personal information',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      color: AppColors.gray3,
                                                      fontWeight: currentRoute ==
                                                              Routes
                                                                  .personalInformation
                                                          ? FontWeight.w600
                                                          : FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  )
                              ],
                            ),
                          ),
                        )),
                const SizedBox(width: 10),
                HeaderDesktopLink(
                    text: 'Logout', active: false, onPressed: onLogout),
                const SizedBox(width: 10),
                if (!suspended)
                  Container(
                    padding: EdgeInsets.only(top: 2),
                    child: Opacity(
                      opacity: 0.7,
                      child: IconButton(
                        onPressed: onToggleSearch,
                        splashRadius: 25,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(
                          Icons.search,
                          color: AppColors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  )
              ],
            ));
  }
}
