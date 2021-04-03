import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/request_invitation_form_values.model.dart';
import 'package:flutter_web_app/store/auth/auth.actions.dart';
import 'package:flutter_web_app/store/auth/auth.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';

class RequestInvitationForm extends StatefulWidget {
  @override
  _RequestInvitationFormState createState() => _RequestInvitationFormState();
}

class _RequestInvitationFormState extends State<RequestInvitationForm> {
  final formKey = GlobalKey<FormState>();

  String firstName;
  String lastName;
  String email;
  String smsNumber;

  onFirstNameChanged(String value) {
    setState(() {
      firstName = value;
    });
  }

  onLastNameChanged(String value) {
    setState(() {
      lastName = value;
    });
  }

  onEmailChanged(String value) {
    setState(() {
      email = value;
    });
  }

  onSmsNumberChanged(String value) {
    setState(() {
      smsNumber = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _RequestInvitationFormProps>(
      builder: (context, props) {
        return Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            decoration: BoxDecoration(color: AppColors.blue1.withOpacity(0.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildTextField('Enter your First Name', emptyValidator,
                    onFirstNameChanged),
                const SizedBox(height: 10),
                buildTextField(
                    'Enter your Last Name', emptyValidator, onLastNameChanged),
                const SizedBox(height: 10),
                buildTextField(
                    'Enter your Email',
                    composeValidators([emptyValidator, emailValidator]),
                    onEmailChanged),
                const SizedBox(height: 10),
                buildTextField('Enter your Mobile Number', emptyValidator,
                    onSmsNumberChanged),
                const SizedBox(height: 46),
                buildButton('REQUEST AN INVITATION', props.loading, () {
                  if (formKey.currentState.validate()) {
                    props.onRequestInvitation(RequestInvitationFormValuesModel(
                        firstName: firstName.trim(),
                        lastName: lastName.trim(),
                        email: email.trim(),
                        smsNumber: smsNumber.trim()));
                  }
                })
              ],
            ),
          ),
        );
      },
      converter: _RequestInvitationFormProps.fromStore,
      distinct: true,
    );
  }

  buildTextField(
      String placeholder, Function validator, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          placeholder,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
        ),
        const SizedBox(height: 10),
        TextFormField(
          validator: validator,
          onChanged: onChanged,
          style: GoogleFonts.poppins(
              color: AppColors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              hoverColor: AppColors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4))),
        )
      ],
    );
  }

  buildButton(String text, bool loading, VoidCallback onPressed) {
    return RaisedButton(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: loading
            ? Center(
                child: SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                  width: 21,
                  height: 21,
                ),
              )
            : Text(text,
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white)),
      ),
      onPressed: onPressed,
      color: AppColors.black,
    );
  }
}

class _RequestInvitationFormProps extends Equatable {
  final Function(RequestInvitationFormValuesModel) onRequestInvitation;
  final bool loading;

  _RequestInvitationFormProps(
      {@required this.onRequestInvitation, @required this.loading});

  static _RequestInvitationFormProps fromStore(Store<ApplicationState> store) {
    return _RequestInvitationFormProps(
        loading: isRequestingInvitationSelector(store.state),
        onRequestInvitation: (RequestInvitationFormValuesModel values) {
          store.dispatch(GetInvitationAction(values: values));
        });
  }

  @override
  List<Object> get props => [loading];
}
