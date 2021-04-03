import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/login/authorization_form/authorization_form.dart';
import 'package:flutter_web_app/widgets/login/form_header/form_header.dart';
import 'package:flutter_web_app/widgets/login/request_invitation_form/request_invitation_form.dart';

class LoginLayoutMobile extends StatelessWidget {
  final Function(String, String) onLogin;
  final bool loading;

  LoginLayoutMobile({@required this.onLogin, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          FormHeader(
              title: 'Login Here',
              subtitle:
                  'Membership is licenced to 1 person per account.  Your IP address will be recorded. Multiple logins into the same account may disable your access. We recommend you use Chrome / Firefox web browser on your phone or desktop for the best user experience.'),
          const SizedBox(height: 20),
          AuthorizationForm(onSubmit: onLogin, loading: loading),
          const SizedBox(height: 20),
          FormHeader(
              title: 'Not a member yet?',
              subtitle:
                  'Fill the form below and get on our new member request list.'),
          const SizedBox(height: 20),
          RequestInvitationForm()
        ],
      ),
    );
  }
}
