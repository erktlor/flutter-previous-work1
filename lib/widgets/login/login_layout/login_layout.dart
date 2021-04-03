import 'package:flutter/material.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/login/login_layout/login_layout.desktop.dart';
import 'package:flutter_web_app/widgets/login/login_layout/login_layout.mobile.dart';

class LoginLayout extends StatelessWidget {
  final Function(String, String) onLogin;
  final bool loading;

  LoginLayout({@required this.onLogin, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? LoginLayoutMobile(
            onLogin: onLogin,
            loading: loading,
          )
        : LoginLayoutDesktop(
            onLogin: onLogin,
            loading: loading,
          );
  }
}
