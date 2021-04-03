import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/images.dart';
import 'package:flutter_web_app/common/constants/page_titles.dart';
import 'package:flutter_web_app/store/app/app.actions.dart';
import 'package:flutter_web_app/store/auth/auth.actions.dart';
import 'package:flutter_web_app/store/auth/auth.selectors.dart';
import 'package:flutter_web_app/store/header/header.actions.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/header/not_authorized_header/not_authorized_header.dart';
import 'package:flutter_web_app/widgets/login/login_layout/login_layout.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:redux/redux.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _LoginProps>(
        converter: _LoginProps.fromStore,
        distinct: true,
        onInitialBuild: (props) {
          props.setAppTitle(PageTitles.login);
        },
        onDispose: (store) {
          _LoginProps.fromStore(store).setAppTitle(PageTitles.general);
        },
        builder: (context, props) {
          return Scaffold(
            body: SafeArea(
              bottom: false,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Images.backgroundImg),
                        fit: BoxFit.fitHeight)),
                child: PageLayout(
                  header: NotAuthorizedHeader(),
                  child: LoginLayout(
                    onLogin: props.login,
                    loading: props.isAuthenticating,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _LoginProps extends Equatable {
  final Function(String, String) login;
  final Function(bool) setHeaderShowScrolled;
  final Function(String) setAppTitle;
  final bool isAuthenticating;

  _LoginProps(
      {@required this.isAuthenticating,
      @required this.login,
      @required this.setHeaderShowScrolled,
      @required this.setAppTitle});

  static _LoginProps fromStore(Store<ApplicationState> store) {
    return _LoginProps(
        isAuthenticating: isAuthenticatingSelector(store.state),
        login: (String email, String password) {
          store.dispatch(LoginAction(email: email, password: password));
        },
        setHeaderShowScrolled: (bool showScrolled) {
          store.dispatch(SetHeaderScrolledAction(scrolled: showScrolled));
        },
        setAppTitle: (String title) {
          store.dispatch(SetAppTitleAction(title: title));
        });
  }

  @override
  List<Object> get props => [isAuthenticating];
}
