// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'account.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AccountState _$AccountStateFromJson(Map<String, dynamic> json) {
  return _AccountState.fromJson(json);
}

/// @nodoc
class _$AccountStateTearOff {
  const _$AccountStateTearOff();

// ignore: unused_element
  _AccountState call(
      {List<InvoiceModel> invoices,
      List<SubscriptionModel> subscriptions,
      PersonalInformationModel personalInformation,
      Map<String, bool> checkedInvoices}) {
    return _AccountState(
      invoices: invoices,
      subscriptions: subscriptions,
      personalInformation: personalInformation,
      checkedInvoices: checkedInvoices,
    );
  }

// ignore: unused_element
  AccountState fromJson(Map<String, Object> json) {
    return AccountState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AccountState = _$AccountStateTearOff();

/// @nodoc
mixin _$AccountState {
  List<InvoiceModel> get invoices;
  List<SubscriptionModel> get subscriptions;
  PersonalInformationModel get personalInformation;
  Map<String, bool> get checkedInvoices;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AccountStateCopyWith<AccountState> get copyWith;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res>;
  $Res call(
      {List<InvoiceModel> invoices,
      List<SubscriptionModel> subscriptions,
      PersonalInformationModel personalInformation,
      Map<String, bool> checkedInvoices});
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res> implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  final AccountState _value;
  // ignore: unused_field
  final $Res Function(AccountState) _then;

  @override
  $Res call({
    Object invoices = freezed,
    Object subscriptions = freezed,
    Object personalInformation = freezed,
    Object checkedInvoices = freezed,
  }) {
    return _then(_value.copyWith(
      invoices: invoices == freezed
          ? _value.invoices
          : invoices as List<InvoiceModel>,
      subscriptions: subscriptions == freezed
          ? _value.subscriptions
          : subscriptions as List<SubscriptionModel>,
      personalInformation: personalInformation == freezed
          ? _value.personalInformation
          : personalInformation as PersonalInformationModel,
      checkedInvoices: checkedInvoices == freezed
          ? _value.checkedInvoices
          : checkedInvoices as Map<String, bool>,
    ));
  }
}

/// @nodoc
abstract class _$AccountStateCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$AccountStateCopyWith(
          _AccountState value, $Res Function(_AccountState) then) =
      __$AccountStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<InvoiceModel> invoices,
      List<SubscriptionModel> subscriptions,
      PersonalInformationModel personalInformation,
      Map<String, bool> checkedInvoices});
}

/// @nodoc
class __$AccountStateCopyWithImpl<$Res> extends _$AccountStateCopyWithImpl<$Res>
    implements _$AccountStateCopyWith<$Res> {
  __$AccountStateCopyWithImpl(
      _AccountState _value, $Res Function(_AccountState) _then)
      : super(_value, (v) => _then(v as _AccountState));

  @override
  _AccountState get _value => super._value as _AccountState;

  @override
  $Res call({
    Object invoices = freezed,
    Object subscriptions = freezed,
    Object personalInformation = freezed,
    Object checkedInvoices = freezed,
  }) {
    return _then(_AccountState(
      invoices: invoices == freezed
          ? _value.invoices
          : invoices as List<InvoiceModel>,
      subscriptions: subscriptions == freezed
          ? _value.subscriptions
          : subscriptions as List<SubscriptionModel>,
      personalInformation: personalInformation == freezed
          ? _value.personalInformation
          : personalInformation as PersonalInformationModel,
      checkedInvoices: checkedInvoices == freezed
          ? _value.checkedInvoices
          : checkedInvoices as Map<String, bool>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AccountState with DiagnosticableTreeMixin implements _AccountState {
  const _$_AccountState(
      {this.invoices,
      this.subscriptions,
      this.personalInformation,
      this.checkedInvoices});

  factory _$_AccountState.fromJson(Map<String, dynamic> json) =>
      _$_$_AccountStateFromJson(json);

  @override
  final List<InvoiceModel> invoices;
  @override
  final List<SubscriptionModel> subscriptions;
  @override
  final PersonalInformationModel personalInformation;
  @override
  final Map<String, bool> checkedInvoices;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState(invoices: $invoices, subscriptions: $subscriptions, personalInformation: $personalInformation, checkedInvoices: $checkedInvoices)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState'))
      ..add(DiagnosticsProperty('invoices', invoices))
      ..add(DiagnosticsProperty('subscriptions', subscriptions))
      ..add(DiagnosticsProperty('personalInformation', personalInformation))
      ..add(DiagnosticsProperty('checkedInvoices', checkedInvoices));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountState &&
            (identical(other.invoices, invoices) ||
                const DeepCollectionEquality()
                    .equals(other.invoices, invoices)) &&
            (identical(other.subscriptions, subscriptions) ||
                const DeepCollectionEquality()
                    .equals(other.subscriptions, subscriptions)) &&
            (identical(other.personalInformation, personalInformation) ||
                const DeepCollectionEquality()
                    .equals(other.personalInformation, personalInformation)) &&
            (identical(other.checkedInvoices, checkedInvoices) ||
                const DeepCollectionEquality()
                    .equals(other.checkedInvoices, checkedInvoices)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(invoices) ^
      const DeepCollectionEquality().hash(subscriptions) ^
      const DeepCollectionEquality().hash(personalInformation) ^
      const DeepCollectionEquality().hash(checkedInvoices);

  @JsonKey(ignore: true)
  @override
  _$AccountStateCopyWith<_AccountState> get copyWith =>
      __$AccountStateCopyWithImpl<_AccountState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AccountStateToJson(this);
  }
}

abstract class _AccountState implements AccountState {
  const factory _AccountState(
      {List<InvoiceModel> invoices,
      List<SubscriptionModel> subscriptions,
      PersonalInformationModel personalInformation,
      Map<String, bool> checkedInvoices}) = _$_AccountState;

  factory _AccountState.fromJson(Map<String, dynamic> json) =
      _$_AccountState.fromJson;

  @override
  List<InvoiceModel> get invoices;
  @override
  List<SubscriptionModel> get subscriptions;
  @override
  PersonalInformationModel get personalInformation;
  @override
  Map<String, bool> get checkedInvoices;
  @override
  @JsonKey(ignore: true)
  _$AccountStateCopyWith<_AccountState> get copyWith;
}
