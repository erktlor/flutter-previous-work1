import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/constants/storage_keys.dart';
import 'package:flutter_web_app/common/models/user.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/store/auth/auth.actions.dart';
import 'package:flutter_web_app/utils/async_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:redux_saga/redux_saga.dart';

_handleLogin({LoginAction action}) sync* {
  yield Try(() sync* {
    yield Put(LoginRequestAction());

    final result = Result<Response>();

    yield Call(Api.login,
        args: [action.email, action.password, oneSignalUserId], result: result);

    final user = User.fromJson(result.value.data);

    yield Call(AsyncStorage.saveStringData,
        args: [StorageKeys.authorizedUser, jsonEncode(user.toJson())]);

    Api.setAuthorizationToken(user.token);

    if (user.suspended) {
      navigatorKey.currentState.pushReplacementNamed(Routes.account);
    } else if (!user.onboardingDone) {
      navigatorKey.currentState.pushReplacementNamed(Routes.onboarding);
    } else {
      navigatorKey.currentState.pushReplacementNamed(Routes.dashboard);
    }

    yield Put(LoginSuccessAction(user: user));
  }, Catch: (e, s) sync* {
    if (e is DioError) {
      if (e.response == null) {
        toast('Connection error');
      } else {
        final error = e.response.data['error'];

        if (error == 'not_found') {
          toast('User not found');
        } else if (error == 'incorrect_credentials') {
          toast('Incorrect credentials');
        } else if (error == 'cancelled') {
          navigatorKey.currentState.pushReplacementNamed(Routes.cancelled);
        }
      }
    }

    yield Put(LoginFailureAction());
  });
}

_handleLogout({LogoutAction action}) sync* {
  Api.clearToken();
  yield Call(AsyncStorage.clear, args: [StorageKeys.authorizedUser]);
  navigatorKey.currentState
      .pushNamedAndRemoveUntil(Routes.login, (route) => false);
}

_handleRestorePassword({RestorePasswordAction action}) sync* {
  yield Try(() sync* {
    yield Put(RestorePasswordRequestAction());

    yield Call(Api.restorePassword, args: [action.email]);

    toast('Password was sent to your email');

    yield Put(RestorePasswordSuccessAction());

    navigatorKey.currentState.pop();
  }, Catch: (e, s) sync* {
    toast('Error while restoring password');

    yield Put(RestorePasswordFailureAction());
  });
}

_handleGetInvitation({GetInvitationAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetInvitationRequestAction());

    yield Call(Api.requestInvitation, args: [
      action.values.toJson()
        ..addAll({"country": WidgetsBinding.instance.window.locale.countryCode})
    ]);

    navigatorKey.currentState.pushNamed(Routes.thankYou);

    yield Put(GetInvitationSuccessAction());
  }, Catch: (e, s) sync* {
    toast('Error while requesting invitation');
    yield Put(GetInvitationFailureAction());
  });
}

_handleUpdatePassword({UpdatePasswordAction action}) sync* {
  yield Try(() sync* {
    yield Put(UpdatePasswordRequestAction());

    yield Call(Api.updatePassword, args: [action.password]);

    toast('Successfully updated password');

    yield Put(UpdatePasswordSuccessAction());
  }, Catch: (e, s) sync* {
    toast('Error while updating password');
    yield Put(UpdatePasswordFailureAction());
  });
}

_watchLogin() sync* {
  yield TakeLeading(_handleLogin, pattern: LoginAction);
}

_watchLogout() sync* {
  yield TakeLeading(_handleLogout, pattern: LogoutAction);
}

_watchRestorePassword() sync* {
  yield TakeLeading(_handleRestorePassword, pattern: RestorePasswordAction);
}

_watchGetInvitation() sync* {
  yield TakeLeading(_handleGetInvitation, pattern: GetInvitationAction);
}

_watchUpdatePassword() sync* {
  yield TakeLeading(_handleUpdatePassword, pattern: UpdatePasswordAction);
}

authSaga() sync* {
  yield Fork(_watchLogin);
  yield Fork(_watchLogout);
  yield Fork(_watchRestorePassword);
  yield Fork(_watchGetInvitation);
  yield Fork(_watchUpdatePassword);
}
