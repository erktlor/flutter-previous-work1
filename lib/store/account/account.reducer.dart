import 'package:flutter_web_app/store/account/account.actions.dart';
import 'package:flutter_web_app/store/account/account.types.dart';

AccountState accountReducer(AccountState state, action) {
  if (action is GetPaymentInformationSuccessAction) {
    return state.copyWith(
        invoices: action.invoices, subscriptions: action.subscriptions);
  }

  if (action is GetPersonalInformationSuccessAction) {
    return state.copyWith(personalInformation: action.personalInformation);
  }

  if (action is SelectInvoiceAction) {
    final Map<String, bool> checkedInvoicesCopy = {}
      ..addAll(state.checkedInvoices);

    if (checkedInvoicesCopy.containsKey(action.id)) {
      checkedInvoicesCopy.remove(action.id);
    } else {
      checkedInvoicesCopy[action.id] = true;
    }

    return state.copyWith(checkedInvoices: checkedInvoicesCopy);
  }

  if (action is ResendInvoiceSuccessAction) {
    return state.copyWith(checkedInvoices: {});
  }

  return state;
}
