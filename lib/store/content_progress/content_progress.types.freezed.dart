// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'content_progress.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ContentProgressState _$ContentProgressStateFromJson(Map<String, dynamic> json) {
  return _ContentProgressState.fromJson(json);
}

/// @nodoc
class _$ContentProgressStateTearOff {
  const _$ContentProgressStateTearOff();

// ignore: unused_element
  _ContentProgressState call({@required Map<String, int> progresses}) {
    return _ContentProgressState(
      progresses: progresses,
    );
  }

// ignore: unused_element
  ContentProgressState fromJson(Map<String, Object> json) {
    return ContentProgressState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ContentProgressState = _$ContentProgressStateTearOff();

/// @nodoc
mixin _$ContentProgressState {
  Map<String, int> get progresses;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ContentProgressStateCopyWith<ContentProgressState> get copyWith;
}

/// @nodoc
abstract class $ContentProgressStateCopyWith<$Res> {
  factory $ContentProgressStateCopyWith(ContentProgressState value,
          $Res Function(ContentProgressState) then) =
      _$ContentProgressStateCopyWithImpl<$Res>;
  $Res call({Map<String, int> progresses});
}

/// @nodoc
class _$ContentProgressStateCopyWithImpl<$Res>
    implements $ContentProgressStateCopyWith<$Res> {
  _$ContentProgressStateCopyWithImpl(this._value, this._then);

  final ContentProgressState _value;
  // ignore: unused_field
  final $Res Function(ContentProgressState) _then;

  @override
  $Res call({
    Object progresses = freezed,
  }) {
    return _then(_value.copyWith(
      progresses: progresses == freezed
          ? _value.progresses
          : progresses as Map<String, int>,
    ));
  }
}

/// @nodoc
abstract class _$ContentProgressStateCopyWith<$Res>
    implements $ContentProgressStateCopyWith<$Res> {
  factory _$ContentProgressStateCopyWith(_ContentProgressState value,
          $Res Function(_ContentProgressState) then) =
      __$ContentProgressStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, int> progresses});
}

/// @nodoc
class __$ContentProgressStateCopyWithImpl<$Res>
    extends _$ContentProgressStateCopyWithImpl<$Res>
    implements _$ContentProgressStateCopyWith<$Res> {
  __$ContentProgressStateCopyWithImpl(
      _ContentProgressState _value, $Res Function(_ContentProgressState) _then)
      : super(_value, (v) => _then(v as _ContentProgressState));

  @override
  _ContentProgressState get _value => super._value as _ContentProgressState;

  @override
  $Res call({
    Object progresses = freezed,
  }) {
    return _then(_ContentProgressState(
      progresses: progresses == freezed
          ? _value.progresses
          : progresses as Map<String, int>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ContentProgressState
    with DiagnosticableTreeMixin
    implements _ContentProgressState {
  const _$_ContentProgressState({@required this.progresses})
      : assert(progresses != null);

  factory _$_ContentProgressState.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentProgressStateFromJson(json);

  @override
  final Map<String, int> progresses;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContentProgressState(progresses: $progresses)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContentProgressState'))
      ..add(DiagnosticsProperty('progresses', progresses));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContentProgressState &&
            (identical(other.progresses, progresses) ||
                const DeepCollectionEquality()
                    .equals(other.progresses, progresses)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(progresses);

  @JsonKey(ignore: true)
  @override
  _$ContentProgressStateCopyWith<_ContentProgressState> get copyWith =>
      __$ContentProgressStateCopyWithImpl<_ContentProgressState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContentProgressStateToJson(this);
  }
}

abstract class _ContentProgressState implements ContentProgressState {
  const factory _ContentProgressState({@required Map<String, int> progresses}) =
      _$_ContentProgressState;

  factory _ContentProgressState.fromJson(Map<String, dynamic> json) =
      _$_ContentProgressState.fromJson;

  @override
  Map<String, int> get progresses;
  @override
  @JsonKey(ignore: true)
  _$ContentProgressStateCopyWith<_ContentProgressState> get copyWith;
}
