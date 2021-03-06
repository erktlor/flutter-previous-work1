// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'loading.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
LoadingState _$LoadingStateFromJson(Map<String, dynamic> json) {
  return _LoadingState.fromJson(json);
}

/// @nodoc
class _$LoadingStateTearOff {
  const _$LoadingStateTearOff();

// ignore: unused_element
  _LoadingState call({@required Map<String, bool> actions}) {
    return _LoadingState(
      actions: actions,
    );
  }

// ignore: unused_element
  LoadingState fromJson(Map<String, Object> json) {
    return LoadingState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $LoadingState = _$LoadingStateTearOff();

/// @nodoc
mixin _$LoadingState {
  Map<String, bool> get actions;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $LoadingStateCopyWith<LoadingState> get copyWith;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
  $Res call({Map<String, bool> actions});
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res> implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(this._value, this._then);

  final LoadingState _value;
  // ignore: unused_field
  final $Res Function(LoadingState) _then;

  @override
  $Res call({
    Object actions = freezed,
  }) {
    return _then(_value.copyWith(
      actions:
          actions == freezed ? _value.actions : actions as Map<String, bool>,
    ));
  }
}

/// @nodoc
abstract class _$LoadingStateCopyWith<$Res>
    implements $LoadingStateCopyWith<$Res> {
  factory _$LoadingStateCopyWith(
          _LoadingState value, $Res Function(_LoadingState) then) =
      __$LoadingStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, bool> actions});
}

/// @nodoc
class __$LoadingStateCopyWithImpl<$Res> extends _$LoadingStateCopyWithImpl<$Res>
    implements _$LoadingStateCopyWith<$Res> {
  __$LoadingStateCopyWithImpl(
      _LoadingState _value, $Res Function(_LoadingState) _then)
      : super(_value, (v) => _then(v as _LoadingState));

  @override
  _LoadingState get _value => super._value as _LoadingState;

  @override
  $Res call({
    Object actions = freezed,
  }) {
    return _then(_LoadingState(
      actions:
          actions == freezed ? _value.actions : actions as Map<String, bool>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_LoadingState with DiagnosticableTreeMixin implements _LoadingState {
  const _$_LoadingState({@required this.actions}) : assert(actions != null);

  factory _$_LoadingState.fromJson(Map<String, dynamic> json) =>
      _$_$_LoadingStateFromJson(json);

  @override
  final Map<String, bool> actions;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoadingState(actions: $actions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoadingState'))
      ..add(DiagnosticsProperty('actions', actions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingState &&
            (identical(other.actions, actions) ||
                const DeepCollectionEquality().equals(other.actions, actions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(actions);

  @JsonKey(ignore: true)
  @override
  _$LoadingStateCopyWith<_LoadingState> get copyWith =>
      __$LoadingStateCopyWithImpl<_LoadingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LoadingStateToJson(this);
  }
}

abstract class _LoadingState implements LoadingState {
  const factory _LoadingState({@required Map<String, bool> actions}) =
      _$_LoadingState;

  factory _LoadingState.fromJson(Map<String, dynamic> json) =
      _$_LoadingState.fromJson;

  @override
  Map<String, bool> get actions;
  @override
  @JsonKey(ignore: true)
  _$LoadingStateCopyWith<_LoadingState> get copyWith;
}
