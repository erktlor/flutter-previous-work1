import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/store/auth/auth.actions.dart';
import 'package:flutter_web_app/store/auth/auth.selectors.dart';
import 'package:flutter_web_app/store/search/search.actions.dart';
import 'package:flutter_web_app/store/search/search.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.desktop.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header_search.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authrozied_header.mobile.dart';
import 'package:redux/redux.dart';

class AuthorizedHeader extends StatefulWidget {
  @override
  _AuthorizedHeaderState createState() => _AuthorizedHeaderState();
}

class _AuthorizedHeaderState extends State<AuthorizedHeader>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var mobile = isMobile(context);
    final routeName = ModalRoute.of(context).settings.name;

    return StoreConnector<ApplicationState, AuthorizedHeaderProps>(
      converter: AuthorizedHeaderProps.fromStore,
      distinct: true,
      onInitialBuild: (props) {
        if (routeName.contains(Routes.search) && !props.searchEnabled) {
          props.toggleSearchEnabled();
        }
      },
      builder: (context, props) {
        return Column(
          children: [
            mobile
                ? AuthorizedHeaderMobile(
                    onLogout: props.logout,
                    onToggleSearch: props.toggleSearchEnabled,
                    suspended: props.suspended,
                  )
                : AuthorizedHeaderDesktop(
                    onLogout: props.logout,
                    onToggleSearch: props.toggleSearchEnabled,
                    suspended: props.suspended,
                  ),
            AnimatedSize(
              vsync: this,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 250),
              child: props.searchEnabled
                  ? AuthorizedHeaderSearch()
                  : const SizedBox.shrink(),
            )
          ],
        );
      },
    );
  }
}

class AuthorizedHeaderProps extends Equatable {
  final bool searchEnabled;
  final VoidCallback logout;
  final VoidCallback toggleSearchEnabled;
  final bool suspended;

  AuthorizedHeaderProps({
    @required this.searchEnabled,
    @required this.suspended,
    @required this.logout,
    @required this.toggleSearchEnabled,
  });

  static AuthorizedHeaderProps fromStore(Store<ApplicationState> store) {
    return AuthorizedHeaderProps(
        searchEnabled: searchEnabledSelector(store.state),
        suspended: isUserSuspendedSelector(store.state),
        logout: () {
          store.dispatch(LogoutAction());
        },
        toggleSearchEnabled: () {
          store.dispatch(ToggleSearchEnabledAction());
        });
  }

  @override
  List<Object> get props => [searchEnabled];
}
