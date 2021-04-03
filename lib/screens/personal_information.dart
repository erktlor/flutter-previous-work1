import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/store/account/account.actions.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:flutter_web_app/widgets/personal_information/personal_information_content/personal_information_content.dart';
import 'package:redux/redux.dart';

class PersonalInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _PersonalInformationProps>(
      onInitialBuild: (props) {
        props.getPersonalInformation();
      },
      builder: (context, props) {
        return Scaffold(
          body: PageLayout(
              header: AuthorizedHeader(), child: PersonalInformationContent()),
        );
      },
      converter: _PersonalInformationProps.fromStore,
      distinct: true,
    );
  }
}

class _PersonalInformationProps extends Equatable {
  final VoidCallback getPersonalInformation;

  _PersonalInformationProps({@required this.getPersonalInformation});

  static _PersonalInformationProps fromStore(Store<ApplicationState> store) {
    return _PersonalInformationProps(getPersonalInformation: () {
      store.dispatch(GetPersonalInformationAction());
    });
  }

  @override
  List<Object> get props => [];
}
