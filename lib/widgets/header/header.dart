import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/store/auth/auth.selectors.dart';
import 'package:flutter_web_app/store/header/header.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';

class Header extends StatelessWidget {
  final Widget Function(bool scrolled) buildLinks;
  final String Function(bool scrolled) getImageLogo;

  Header({@required this.buildLinks, @required this.getImageLogo});

  @override
  Widget build(BuildContext context) {
    var mobile = isMobile(context);

    return StoreConnector<ApplicationState, HeaderProps>(
        converter: HeaderProps.fromStore,
        distinct: true,
        builder: (context, props) {
          final defaultStyle = GoogleFonts.poppins(
              fontSize: mobile ? 16 : 24,
              fontWeight: FontWeight.w700,
              color: AppColors.gray3);

          final linkStyle = GoogleFonts.poppins(
              fontSize: mobile ? 16 : 24,
              fontWeight: FontWeight.w700,
              color: AppColors.blue0);

          return Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: props.scrolled ? 60 : 80,
                color: props.scrolled ? AppColors.white : Colors.transparent,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image(
                        image: NetworkImage(getImageLogo(props.scrolled)),
                      ),
                    ),
                    Spacer(),
                    buildLinks(props.scrolled),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                ),
              ),
              if (props.suspended)
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  color: AppColors.green0,
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(style: defaultStyle, children: [
                        TextSpan(
                            text:
                                'Your account is suspended.\nPlease update your subscription payment method.\n'),
                        TextSpan(
                            text: 'Contact',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openLink('mailto:support@tompanos.com.au');
                              }),
                        TextSpan(text: ' support if you have any questions')
                      ])),
                )
            ],
          );
        });
  }
}

class HeaderProps extends Equatable {
  final bool scrolled;
  final bool suspended;

  HeaderProps({@required this.scrolled, @required this.suspended});

  static HeaderProps fromStore(Store<ApplicationState> store) {
    return HeaderProps(
        scrolled: headerScrolledSelector(store.state),
        suspended: isUserSuspendedSelector(store.state));
  }

  @override
  List<Object> get props => [scrolled, suspended];
}
