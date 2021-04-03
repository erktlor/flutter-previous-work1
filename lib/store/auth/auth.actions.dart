import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/request_invitation_form_values.model.dart';
import 'package:flutter_web_app/common/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.actions.g.dart';

class LoginAction {
  final String email;
  final String password;

  LoginAction({
    @required this.email,
    @required this.password,
  });
}

class LoginRequestAction {}

class LoginSuccessAction {
  final User user;

  LoginSuccessAction({@required this.user});
}

class LogoutAction {}

class LoginFailureAction {}

@JsonSerializable()
class RestorePasswordAction {
  final String email;

  RestorePasswordAction({@required this.email});

  factory RestorePasswordAction.fromJson(Map<String, dynamic> json) =>
      _$RestorePasswordActionFromJson(json);
  Map<String, dynamic> toJson() => _$RestorePasswordActionToJson(this);
}

class RestorePasswordRequestAction {}

class RestorePasswordSuccessAction {}

class RestorePasswordFailureAction {}

@JsonSerializable()
class GetInvitationAction {
  final RequestInvitationFormValuesModel values;

  GetInvitationAction({@required this.values});

  factory GetInvitationAction.fromJson(Map<String, dynamic> json) =>
      _$GetInvitationActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetInvitationActionToJson(this);
}

class GetInvitationRequestAction {}

class GetInvitationSuccessAction {}

class GetInvitationFailureAction {}

@JsonSerializable()
class UpdatePasswordAction {
  final String password;

  UpdatePasswordAction({@required this.password});

  factory UpdatePasswordAction.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordActionFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatePasswordActionToJson(this);
}

class UpdatePasswordRequestAction {}

class UpdatePasswordSuccessAction {}

class UpdatePasswordFailureAction {}
