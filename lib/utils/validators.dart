import 'package:flutter/widgets.dart';
import 'package:validators/validators.dart';

String emptyValidator(String value) {
  if (value.isEmpty) {
    return 'Please fill mandatory field';
  }
  return null;
}

String emailValidator(String value) {
  if (!isEmail(value)) {
    return 'Incorrect email';
  }

  return null;
}

FormFieldValidator<String> composeValidators(
    List<FormFieldValidator<String>> validators) {
  return (value) {
    for (final validator in validators) {
      final result = validator(value);
      if (result != null) return result;
    }
    return null;
  };
}
