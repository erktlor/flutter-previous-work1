import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/invoice.model.dart';
import 'package:flutter_web_app/common/models/personal_information.model.dart';
import 'package:flutter_web_app/common/models/subscription.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.types.freezed.dart';
part 'account.types.g.dart';

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState(
      {List<InvoiceModel> invoices,
      List<SubscriptionModel> subscriptions,
      PersonalInformationModel personalInformation,
      Map<String, bool> checkedInvoices}) = _AccountState;

  factory AccountState.initialState() => AccountState(
      invoices: [],
      subscriptions: [],
      personalInformation: null,
      checkedInvoices: {});

  factory AccountState.fromJson(Map<String, dynamic> json) =>
      _$AccountStateFromJson(json);
}
