import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/store/auth/auth.actions.dart';
import 'package:flutter_web_app/store/auth/auth.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:redux/redux.dart';

import 'account_action_button.dart';
import 'account_form_title.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return StoreConnector<ApplicationState, _ChangePasswordProps>(
      builder: (context, props) {
        return Container(
          child: Flex(
            direction: mobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
                mobile ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: mobile ? 0 : 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccountFormTitle(
                        text: 'Change your password for this site'),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: mobile ? double.infinity : 500),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: TextFormField(
                          controller: newPasswordController,
                          decoration: InputDecoration(
                              hintText: 'Enter New Password',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: AppColors.gray9),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: mobile ? double.infinity : 500),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: TextFormField(
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                              hintText: 'Confirm New Password',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: AppColors.gray9),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              Expanded(
                flex: mobile ? 0 : 1,
                child: AccountActionButton(
                    text: 'SAVE NEW PASSWORD',
                    onTap: props.loading
                        ? null
                        : () {
                            if (newPasswordController.text.isEmpty) {
                              toast('Please enter new password');
                            } else if (newPasswordController.text !=
                                confirmPasswordController.text) {
                              toast('Passwords are not equal');
                            } else {
                              props.updatePassword(
                                  confirmPasswordController.text);
                              newPasswordController.text = '';
                              confirmPasswordController.text = '';
                            }
                          }),
              )
            ],
          ),
        );
      },
      converter: _ChangePasswordProps.fromStore,
      distinct: true,
    );
  }
}

class _ChangePasswordProps extends Equatable {
  final bool loading;
  final Function(String) updatePassword;

  _ChangePasswordProps({@required this.loading, @required this.updatePassword});

  static _ChangePasswordProps fromStore(Store<ApplicationState> store) {
    return _ChangePasswordProps(
        loading: isUpdatingPasswordSelector(store.state),
        updatePassword: (String password) {
          store.dispatch(UpdatePasswordAction(password: password));
        });
  }

  @override
  List<Object> get props => [loading];
}
