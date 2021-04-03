import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/store/auth/auth.actions.dart';
import 'package:flutter_web_app/store/auth/auth.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';

class RestorePasswordDialog extends StatefulWidget {
  @override
  _RestorePasswordDialogState createState() => _RestorePasswordDialogState();
}

class _RestorePasswordDialogState extends State<RestorePasswordDialog> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _RestorePasswordDialogProps>(
      builder: (context, props) {
        return Material(
          color: Colors.black.withOpacity(0.1),
          child: Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(5),
                  width: 420,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.gray24,
                        ),
                        height: 37,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  size: 16,
                                ),
                                onPressed: () =>
                                    navigatorKey.currentState.pop())
                          ],
                        ),
                      ),
                      const SizedBox(height: 45),
                      Form(
                        key: formKey,
                        child: Container(
                          color: AppColors.blue6,
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter the email address you use to login to request your login information be sent to your email.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: emailController,
                                validator: emptyValidator,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: 'Enter Your Email',
                                    filled: true,
                                    fillColor: AppColors.white),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Your password will be sent to this address.',
                                style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: AppColors.gray25,
                                    fontStyle: FontStyle.italic),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                child: RaisedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('REQUEST PASSWORD',
                                        style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.white)),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      props.restorePassword(
                                          emailController.text.trim());
                                    }
                                  },
                                  color: AppColors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (props.loading)
                Positioned.fill(
                  child: Container(
                    color: AppColors.black.withOpacity(0.3),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
            ],
          ),
        );
      },
      converter: _RestorePasswordDialogProps.fromStore,
      distinct: true,
    );
  }
}

class _RestorePasswordDialogProps extends Equatable {
  final bool loading;
  final Function(String) restorePassword;

  _RestorePasswordDialogProps(
      {@required this.loading, @required this.restorePassword});

  static _RestorePasswordDialogProps fromStore(Store<ApplicationState> store) {
    return _RestorePasswordDialogProps(
        loading: isRestoringPasswordSelector(store.state),
        restorePassword: (String email) {
          store.dispatch(RestorePasswordAction(email: email));
        });
  }

  @override
  List<Object> get props => [loading];
}
