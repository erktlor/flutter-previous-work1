import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/models/invoice.model.dart';
import 'package:flutter_web_app/common/models/personal_information.model.dart';
import 'package:flutter_web_app/common/models/subscription.model.dart';
import 'package:flutter_web_app/store/account/account.actions.dart';
import 'package:flutter_web_app/store/account/account.selectors.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetPaymentInformation({GetPaymentInformationAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetPaymentInformationRequestAction());

    final result = Result<Response>();

    yield Call(Api.getPaymentInformation, result: result);

    List<InvoiceModel> invoices = result.value.data['invoices']
        .map<InvoiceModel>((jsonItem) => InvoiceModel.fromJson(jsonItem))
        .toList();

    List<SubscriptionModel> subscriptions = result.value.data['subscriptions']
        .map<SubscriptionModel>(
            (jsonItem) => SubscriptionModel.fromJson(jsonItem))
        .toList();

    yield Put(GetPaymentInformationSuccessAction(
        invoices: invoices, subscriptions: subscriptions));
  }, Catch: (e, s) sync* {
    yield Put(GetPaymentInformationFailureAction());
  });
}

_handleGetPersonalInformation({GetPersonalInformationAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetPersonalInformationRequestAction());

    final result = Result<Response>();

    yield Call(Api.getPersonalInformation, result: result);

    yield Put(GetPersonalInformationSuccessAction(
        personalInformation:
            PersonalInformationModel.fromJson(result.value.data)));
  }, Catch: (e, s) sync* {
    yield Put(GetPersonalInformationFailureAction());
  });
}

_handleUpdatePersonalInformation(
    {UpdatePersonalInformationAction action}) sync* {
  yield Try(() sync* {
    yield Put(UpdatePersonalInformationRequestAction());

    yield Call(Api.updatePersonalInformation,
        args: [action.personalInformation.toJson()]);

    toast('Personal information successfully updated');

    yield Put(UpdatePersonalInformationSuccessAction());
  }, Catch: (e, s) sync* {
    toast('Error while updating personal information, try again later');
    yield Put(UpdatePersonalInformationFailureAction());
  });
}

_handleResendInvoice({ResendInvoiceAction action}) sync* {
  final checkedInvoicesResult = Result<Map<String, bool>>();
  yield Select(
      selector: checkedInvoicesSelector, result: checkedInvoicesResult);

  if (checkedInvoicesResult.value.length == 0) {
    toast('Please select invoices');
    return;
  }

  yield Try(() sync* {
    yield Put(ResendInvoiceRequestAction());

    yield Call(Api.resendInvoice, args: [
      jsonEncode(
          checkedInvoicesResult.value.keys.map((id) => int.parse(id)).toList())
    ]);

    toast(
        'Successfully resent invoice${checkedInvoicesResult.value.length > 1 ? 's' : ''}');

    yield Put(ResendInvoiceSuccessAction());
  }, Catch: (e, s) sync* {
    toast('Error while resending invoice, try again later');
    yield Put(ResendInvoiceFailureAction());
  });
}

_watchGetPaymentInformation() sync* {
  yield TakeLeading(_handleGetPaymentInformation,
      pattern: GetPaymentInformationAction);
}

_watchGetPersonalInformation() sync* {
  yield TakeLeading(_handleGetPersonalInformation,
      pattern: GetPersonalInformationAction);
}

_watchUpdatePersonalInformation() sync* {
  yield TakeLeading(_handleUpdatePersonalInformation,
      pattern: UpdatePersonalInformationAction);
}

_watchResendInvoice() sync* {
  yield TakeLeading(_handleResendInvoice, pattern: ResendInvoiceAction);
}

accountSaga() sync* {
  yield Fork(_watchGetPaymentInformation);
  yield Fork(_watchGetPersonalInformation);
  yield Fork(_watchUpdatePersonalInformation);
  yield Fork(_watchResendInvoice);
}
