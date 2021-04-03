import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/utils/validators.dart';
import 'package:flutter_web_app/widgets/login/authorization_form/restore_password_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorizationForm extends StatefulWidget {
  final Function(String, String) onSubmit;
  final bool loading;

  AuthorizationForm({@required this.onSubmit, @required this.loading});

  @override
  _AuthorizationFormState createState() => _AuthorizationFormState();
}

class _AuthorizationFormState extends State<AuthorizationForm> {
  final formKey = GlobalKey<FormState>();

  String email;
  String password;

  onEmailChanged(String value) {
    setState(() {
      email = value;
    });
  }

  onPasswordChanged(String value) {
    setState(() {
      password = value;
    });
  }

  onSubmit() {
    if (formKey.currentState.validate()) {
      widget.onSubmit(email.trim(), password.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        decoration: BoxDecoration(color: AppColors.white.withOpacity(0.9)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTextField('Email', emptyValidator, onEmailChanged),
            const SizedBox(height: 10),
            buildTextField('Password', emptyValidator, onPasswordChanged,
                obscureText: true),
            const SizedBox(height: 20),
            buildButton('LOG IN', onSubmit, loading: widget.loading),
            const SizedBox(height: 10),
            buildForgotPassword(),
          ],
        ),
      ),
    );
  }

  buildTextField(
      String placeholder, Function validator, Function(String) onChanged,
      {obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          placeholder,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.gray3),
        ),
        const SizedBox(height: 10),
        TextFormField(
          validator: validator,
          onChanged: onChanged,
          obscureText: obscureText,
          style: GoogleFonts.poppins(
              color: AppColors.gray10,
              fontSize: 13,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.gray9,
              hoverColor: AppColors.gray9,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4))),
        )
      ],
    );
  }

  buildForgotPassword() {
    return Row(
      children: [
        TextButton(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Forgot your password?',
                style: GoogleFonts.poppins(
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black),
              ),
            ),
            onPressed: onForgotPassword)
      ],
    );
  }

  void onForgotPassword() {
    showDialog(context: context, builder: (_) => RestorePasswordDialog());
  }

  buildButton(String text, VoidCallback onPressed, {bool loading = false}) {
    return RaisedButton(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: loading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.black),
                ))
            : Text(text,
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray3)),
      ),
      onPressed: onPressed,
      color: AppColors.green0,
    );
  }
}
