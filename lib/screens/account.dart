import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/store/account/account.actions.dart';
import 'package:flutter_web_app/store/auth/auth.selectors.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.actions.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/account/account_content/account_content.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:redux/redux.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _AccountProps>(
      onInitialBuild: (props) {
        props.getPaymentInformation();
        props.getOnboardingResults();
      },
      builder: (context, props) {
        return Scaffold(
          body: PageLayout(
              header: AuthorizedHeader(),
              child: AccountContent(
                suspended: props.suspended,
              )),
        );
      },
      converter: _AccountProps.fromStore,
      distinct: true,
    );
  }
}

class _AccountProps extends Equatable {
  final VoidCallback getPaymentInformation;
  final VoidCallback getOnboardingResults;
  final bool suspended;

  _AccountProps(
      {@required this.getPaymentInformation,
      @required this.suspended,
      @required this.getOnboardingResults});

  static _AccountProps fromStore(Store<ApplicationState> store) {
    return _AccountProps(
        suspended: isUserSuspendedSelector(store.state),
        getPaymentInformation: () {
          store.dispatch(GetPaymentInformationAction());
        },
        getOnboardingResults: () {
          store.dispatch(GetOnboardingResultsAction());
        });
  }

  @override
  List<Object> get props => [];
}
