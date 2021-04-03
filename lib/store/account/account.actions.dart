import 'package:flutter_web_app/common/models/invoice.model.dart';
import 'package:flutter_web_app/common/models/personal_information.model.dart';
import 'package:flutter_web_app/common/models/subscription.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.actions.g.dart';

@JsonSerializable()
class GetPaymentInformationAction {
  GetPaymentInformationAction();

  factory GetPaymentInformationAction.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentInformationActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetPaymentInformationActionToJson(this);
}

class GetPaymentInformationRequestAction {}

@JsonSerializable()
class GetPaymentInformationSuccessAction {
  final List<InvoiceModel> invoices;
  final List<SubscriptionModel> subscriptions;

  GetPaymentInformationSuccessAction(
      {@required this.invoices, @required this.subscriptions});

  factory GetPaymentInformationSuccessAction.fromJson(
          Map<String, dynamic> json) =>
      _$GetPaymentInformationSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetPaymentInformationSuccessActionToJson(this);
}

class GetPaymentInformationFailureAction {}

@JsonSerializable()
class GetPersonalInformationAction {
  GetPersonalInformationAction();

  factory GetPersonalInformationAction.fromJson(Map<String, dynamic> json) =>
      _$GetPersonalInformationActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetPersonalInformationActionToJson(this);
}

class GetPersonalInformationRequestAction {}

@JsonSerializable()
class GetPersonalInformationSuccessAction {
  final PersonalInformationModel personalInformation;

  GetPersonalInformationSuccessAction({@required this.personalInformation});

  factory GetPersonalInformationSuccessAction.fromJson(
          Map<String, dynamic> json) =>
      _$GetPersonalInformationSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetPersonalInformationSuccessActionToJson(this);
}

class GetPersonalInformationFailureAction {}

@JsonSerializable()
class UpdatePersonalInformationAction {
  final PersonalInformationModel personalInformation;

  UpdatePersonalInformationAction({@required this.personalInformation});

  factory UpdatePersonalInformationAction.fromJson(Map<String, dynamic> json) =>
      _$UpdatePersonalInformationActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UpdatePersonalInformationActionToJson(this);
}

class UpdatePersonalInformationRequestAction {}

@JsonSerializable()
class UpdatePersonalInformationSuccessAction {
  UpdatePersonalInformationSuccessAction();

  factory UpdatePersonalInformationSuccessAction.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePersonalInformationSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UpdatePersonalInformationSuccessActionToJson(this);
}

class UpdatePersonalInformationFailureAction {}

@JsonSerializable()
class SelectInvoiceAction {
  final String id;

  SelectInvoiceAction({@required this.id});

  factory SelectInvoiceAction.fromJson(Map<String, dynamic> json) =>
      _$SelectInvoiceActionFromJson(json);
  Map<String, dynamic> toJson() => _$SelectInvoiceActionToJson(this);
}

class ResendInvoiceAction {}

class ResendInvoiceRequestAction {}

class ResendInvoiceSuccessAction {}

class ResendInvoiceFailureAction {}
