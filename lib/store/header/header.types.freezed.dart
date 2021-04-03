// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'header.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HeaderState _$HeaderStateFromJson(Map<String, dynamic> json) {
  return _HeaderState.fromJson(json);
}

/// @nodoc
class _$HeaderStateTearOff {
  const _$HeaderStateTearOff();

// ignore: unused_element
  _HeaderState call({@required bool scrolled}) {
    return _HeaderState(
      scrolled: scrolled,
    );
  }

// ignore: unused_element
  HeaderState fromJson(Map<String, Object> json) {
    return HeaderState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $HeaderState = _$HeaderStateTearOff();

/// @nodoc
mixin _$HeaderState {
  bool get scrolled;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $HeaderStateCopyWith<HeaderState> get copyWith;
}

/// @nodoc
abstract class $HeaderStateCopyWith<$Res> {
  factory $HeaderStateCopyWith(
          HeaderState value, $Res Function(HeaderState) then) =
      _$HeaderStateCopyWithImpl<$Res>;
  $Res call({bool scrolled});
}

/// @nodoc
class _$HeaderStateCopyWithImpl<$Res> implements $HeaderStateCopyWith<$Res> {
  _$HeaderStateCopyWithImpl(this._value, this._then);

  final HeaderState _value;
  // ignore: unused_field
  final $Res Function(HeaderState) _then;

  @override
  $Res call({
    Object scrolled = freezed,
  }) {
    return _then(_value.copyWith(
      scrolled: scrolled == freezed ? _value.scrolled : scrolled as bool,
    ));
  }
}

/// @nodoc
abstract class _$HeaderStateCopyWith<$Res>
    implements $HeaderStateCopyWith<$Res> {
  factory _$HeaderStateCopyWith(
          _HeaderState value, $Res Function(_HeaderState) then) =
      __$HeaderStateCopyWithImpl<$Res>;
  @override
  $Res call({bool scrolled});
}

/// @nodoc
class __$HeaderStateCopyWithImpl<$Res> extends _$HeaderStateCopyWithImpl<$Res>
    implements _$HeaderStateCopyWith<$Res> {
  __$HeaderStateCopyWithImpl(
      _HeaderState _value, $Res Function(_HeaderState) _then)
      : super(_value, (v) => _then(v as _HeaderState));

  @override
  _HeaderState get _value => super._value as _HeaderState;

  @override
  $Res call({
    Object scrolled = freezed,
  }) {
    return _then(_HeaderState(
      scrolled: scrolled == freezed ? _value.scrolled : scrolled as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_HeaderState with DiagnosticableTreeMixin implements _HeaderState {
  const _$_HeaderState({@required this.scrolled}) : assert(scrolled != null);

  factory _$_HeaderState.fromJson(Map<String, dynamic> json) =>
      _$_$_HeaderStateFromJson(json);

  @override
  final bool scrolled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HeaderState(scrolled: $scrolled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HeaderState'))
      ..add(DiagnosticsProperty('scrolled', scrolled));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HeaderState &&
            (identical(other.scrolled, scrolled) ||
                const DeepCollectionEquality()
                    .equals(other.scrolled, scrolled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(scrolled);

  @JsonKey(ignore: true)
  @override
  _$HeaderStateCopyWith<_HeaderState> get copyWith =>
      __$HeaderStateCopyWithImpl<_HeaderState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HeaderStateToJson(this);
  }
}

abstract class _HeaderState implements HeaderState {
  const factory _HeaderState({@required bool scrolled}) = _$_HeaderState;

  factory _HeaderState.fromJson(Map<String, dynamic> json) =
      _$_HeaderState.fromJson;

  @override
  bool get scrolled;
  @override
  @JsonKey(ignore: true)
  _$HeaderStateCopyWith<_HeaderState> get copyWith;
}
