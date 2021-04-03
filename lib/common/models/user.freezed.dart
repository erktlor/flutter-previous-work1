// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {@required String token,
      @required bool suspended,
      @required bool onboardingDone}) {
    return _User(
      token: token,
      suspended: suspended,
      onboardingDone: onboardingDone,
    );
  }

// ignore: unused_element
  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get token;
  bool get suspended;
  bool get onboardingDone;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({String token, bool suspended, bool onboardingDone});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object token = freezed,
    Object suspended = freezed,
    Object onboardingDone = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed ? _value.token : token as String,
      suspended: suspended == freezed ? _value.suspended : suspended as bool,
      onboardingDone: onboardingDone == freezed
          ? _value.onboardingDone
          : onboardingDone as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({String token, bool suspended, bool onboardingDone});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object token = freezed,
    Object suspended = freezed,
    Object onboardingDone = freezed,
  }) {
    return _then(_User(
      token: token == freezed ? _value.token : token as String,
      suspended: suspended == freezed ? _value.suspended : suspended as bool,
      onboardingDone: onboardingDone == freezed
          ? _value.onboardingDone
          : onboardingDone as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {@required this.token,
      @required this.suspended,
      @required this.onboardingDone})
      : assert(token != null),
        assert(suspended != null),
        assert(onboardingDone != null);

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String token;
  @override
  final bool suspended;
  @override
  final bool onboardingDone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(token: $token, suspended: $suspended, onboardingDone: $onboardingDone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('suspended', suspended))
      ..add(DiagnosticsProperty('onboardingDone', onboardingDone));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.suspended, suspended) ||
                const DeepCollectionEquality()
                    .equals(other.suspended, suspended)) &&
            (identical(other.onboardingDone, onboardingDone) ||
                const DeepCollectionEquality()
                    .equals(other.onboardingDone, onboardingDone)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(suspended) ^
      const DeepCollectionEquality().hash(onboardingDone);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {@required String token,
      @required bool suspended,
      @required bool onboardingDone}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get token;
  @override
  bool get suspended;
  @override
  bool get onboardingDone;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith;
}
