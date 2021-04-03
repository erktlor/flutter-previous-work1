import 'package:flutter_web_app/common/models/invoice.model.dart';
import 'package:flutter_web_app/common/models/personal_information.model.dart';
import 'package:flutter_web_app/common/models/subscription.model.dart';
import 'package:flutter_web_app/store/account/account.actions.dart';
import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/store.dart';

List<InvoiceModel> invoicesSelector(ApplicationState state) {
  return state.account.invoices;
}

List<SubscriptionModel> subscriptionsSelector(ApplicationState state) {
  return state.account.subscriptions;
}

bool isFetchingPaymentInformation(ApplicationState state) {
  return createLoadingSelector([GetPaymentInformationAction])(state);
}

bool isResendingInvoicesSelector(ApplicationState state) {
  return createLoadingSelector([ResendInvoiceAction])(state);
}

PersonalInformationModel personalInformationSelector(ApplicationState state) {
  return state.account.personalInformation;
}

bool isFetchingPersonalInformation(ApplicationState state) {
  return createLoadingSelector([GetPersonalInformationAction])(state);
}

bool isUpdatingPersonalInformation(ApplicationState state) {
  return createLoadingSelector([UpdatePersonalInformationAction])(state);
}

Map<String, bool> checkedInvoicesSelector(ApplicationState state) {
  return state.account.checkedInvoices;
}
