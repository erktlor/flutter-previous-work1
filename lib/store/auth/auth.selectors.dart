import 'package:flutter_web_app/store/auth/auth.actions.dart';
import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/store.dart';

bool isAuthenticatingSelector(ApplicationState state) {
  return createLoadingSelector([LoginAction])(state);
}

bool isRestoringPasswordSelector(ApplicationState state) {
  return createLoadingSelector([RestorePasswordAction])(state);
}

bool isRequestingInvitationSelector(ApplicationState state) {
  return createLoadingSelector([GetInvitationAction])(state);
}

bool isUserSuspendedSelector(ApplicationState state) {
  return state.auth.user != null && state.auth.user.suspended;
}

bool onboardingDoneSelector(ApplicationState state) {
  return state.auth.user != null && state.auth.user.onboardingDone;
}

bool isUpdatingPasswordSelector(ApplicationState state) {
  return createLoadingSelector([UpdatePasswordAction])(state);
}
