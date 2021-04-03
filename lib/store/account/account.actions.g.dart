// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentInformationAction _$GetPaymentInformationActionFromJson(
    Map<String, dynamic> json) {
  return GetPaymentInformationAction();
}

Map<String, dynamic> _$GetPaymentInformationActionToJson(
        GetPaymentInformationAction instance) =>
    <String, dynamic>{};

GetPaymentInformationSuccessAction _$GetPaymentInformationSuccessActionFromJson(
    Map<String, dynamic> json) {
  return GetPaymentInformationSuccessAction(
    invoices: (json['invoices'] as List)
        ?.map((e) =>
            e == null ? null : InvoiceModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subscriptions: (json['subscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : SubscriptionModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetPaymentInformationSuccessActionToJson(
        GetPaymentInformationSuccessAction instance) =>
    <String, dynamic>{
      'invoices': instance.invoices,
      'subscriptions': instance.subscriptions,
    };

GetPersonalInformationAction _$GetPersonalInformationActionFromJson(
    Map<String, dynamic> json) {
  return GetPersonalInformationAction();
}

Map<String, dynamic> _$GetPersonalInformationActionToJson(
        GetPersonalInformationAction instance) =>
    <String, dynamic>{};

GetPersonalInformationSuccessAction
    _$GetPersonalInformationSuccessActionFromJson(Map<String, dynamic> json) {
  return GetPersonalInformationSuccessAction(
    personalInformation: json['personalInformation'] == null
        ? null
        : PersonalInformationModel.fromJson(
            json['personalInformation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetPersonalInformationSuccessActionToJson(
        GetPersonalInformationSuccessAction instance) =>
    <String, dynamic>{
      'personalInformation': instance.personalInformation,
    };

UpdatePersonalInformationAction _$UpdatePersonalInformationActionFromJson(
    Map<String, dynamic> json) {
  return UpdatePersonalInformationAction(
    personalInformation: json['personalInformation'] == null
        ? null
        : PersonalInformationModel.fromJson(
            json['personalInformation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdatePersonalInformationActionToJson(
        UpdatePersonalInformationAction instance) =>
    <String, dynamic>{
      'personalInformation': instance.personalInformation,
    };

UpdatePersonalInformationSuccessAction
    _$UpdatePersonalInformationSuccessActionFromJson(
        Map<String, dynamic> json) {
  return UpdatePersonalInformationSuccessAction();
}

Map<String, dynamic> _$UpdatePersonalInformationSuccessActionToJson(
        UpdatePersonalInformationSuccessAction instance) =>
    <String, dynamic>{};

SelectInvoiceAction _$SelectInvoiceActionFromJson(Map<String, dynamic> json) {
  return SelectInvoiceAction(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$SelectInvoiceActionToJson(
        SelectInvoiceAction instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
