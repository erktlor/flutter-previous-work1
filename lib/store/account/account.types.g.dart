// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountState _$_$_AccountStateFromJson(Map<String, dynamic> json) {
  return _$_AccountState(
    invoices: (json['invoices'] as List)
        ?.map((e) =>
            e == null ? null : InvoiceModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subscriptions: (json['subscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : SubscriptionModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    personalInformation: json['personalInformation'] == null
        ? null
        : PersonalInformationModel.fromJson(
            json['personalInformation'] as Map<String, dynamic>),
    checkedInvoices: (json['checkedInvoices'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    ),
  );
}

Map<String, dynamic> _$_$_AccountStateToJson(_$_AccountState instance) =>
    <String, dynamic>{
      'invoices': instance.invoices,
      'subscriptions': instance.subscriptions,
      'personalInformation': instance.personalInformation,
      'checkedInvoices': instance.checkedInvoices,
    };
