import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/login/authorization_form/authorization_form.dart';
import 'package:flutter_web_app/widgets/login/form_header/form_header.dart';
import 'package:flutter_web_app/widgets/login/request_invitation_form/request_invitation_form.dart';

class LoginLayoutDesktop extends StatelessWidget {
  final Function(String, String) onLogin;
  final bool loading;

  LoginLayoutDesktop({@required this.onLogin, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: FormHeader(
                    title: 'Login Here',
                    subtitle:
                        'Membership is licenced to 1 person per account.  Your IP address will be recorded. Multiple logins into the same account may disable your access. We recommend you use Chrome / Firefox web browser on your phone or desktop for the best user experience.'),
              ),
              const SizedBox(width: 50),
              Flexible(
                child: FormHeader(
                    title: 'Not a member yet?',
                    subtitle:
                        'Fill the form below and get on our new member request list.'),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child:
                      AuthorizationForm(onSubmit: onLogin, loading: loading)),
              const SizedBox(width: 50),
              Flexible(child: RequestInvitationForm())
            ],
          )
        ],
      ),
    );
  }
}
