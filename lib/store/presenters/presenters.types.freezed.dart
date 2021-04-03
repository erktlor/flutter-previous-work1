// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'presenters.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PresentersState _$PresentersStateFromJson(Map<String, dynamic> json) {
  return _PresentersState.fromJson(json);
}

/// @nodoc
class _$PresentersStateTearOff {
  const _$PresentersStateTearOff();

// ignore: unused_element
  _PresentersState call({@required List<PresenterModel> presenters}) {
    return _PresentersState(
      presenters: presenters,
    );
  }

// ignore: unused_element
  PresentersState fromJson(Map<String, Object> json) {
    return PresentersState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PresentersState = _$PresentersStateTearOff();

/// @nodoc
mixin _$PresentersState {
  List<PresenterModel> get presenters;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $PresentersStateCopyWith<PresentersState> get copyWith;
}

/// @nodoc
abstract class $PresentersStateCopyWith<$Res> {
  factory $PresentersStateCopyWith(
          PresentersState value, $Res Function(PresentersState) then) =
      _$PresentersStateCopyWithImpl<$Res>;
  $Res call({List<PresenterModel> presenters});
}

/// @nodoc
class _$PresentersStateCopyWithImpl<$Res>
    implements $PresentersStateCopyWith<$Res> {
  _$PresentersStateCopyWithImpl(this._value, this._then);

  final PresentersState _value;
  // ignore: unused_field
  final $Res Function(PresentersState) _then;

  @override
  $Res call({
    Object presenters = freezed,
  }) {
    return _then(_value.copyWith(
      presenters: presenters == freezed
          ? _value.presenters
          : presenters as List<PresenterModel>,
    ));
  }
}

/// @nodoc
abstract class _$PresentersStateCopyWith<$Res>
    implements $PresentersStateCopyWith<$Res> {
  factory _$PresentersStateCopyWith(
          _PresentersState value, $Res Function(_PresentersState) then) =
      __$PresentersStateCopyWithImpl<$Res>;
  @override
  $Res call({List<PresenterModel> presenters});
}

/// @nodoc
class __$PresentersStateCopyWithImpl<$Res>
    extends _$PresentersStateCopyWithImpl<$Res>
    implements _$PresentersStateCopyWith<$Res> {
  __$PresentersStateCopyWithImpl(
      _PresentersState _value, $Res Function(_PresentersState) _then)
      : super(_value, (v) => _then(v as _PresentersState));

  @override
  _PresentersState get _value => super._value as _PresentersState;

  @override
  $Res call({
    Object presenters = freezed,
  }) {
    return _then(_PresentersState(
      presenters: presenters == freezed
          ? _value.presenters
          : presenters as List<PresenterModel>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_PresentersState
    with DiagnosticableTreeMixin
    implements _PresentersState {
  const _$_PresentersState({@required this.presenters})
      : assert(presenters != null);

  factory _$_PresentersState.fromJson(Map<String, dynamic> json) =>
      _$_$_PresentersStateFromJson(json);

  @override
  final List<PresenterModel> presenters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PresentersState(presenters: $presenters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PresentersState'))
      ..add(DiagnosticsProperty('presenters', presenters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PresentersState &&
            (identical(other.presenters, presenters) ||
                const DeepCollectionEquality()
                    .equals(other.presenters, presenters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(presenters);

  @JsonKey(ignore: true)
  @override
  _$PresentersStateCopyWith<_PresentersState> get copyWith =>
      __$PresentersStateCopyWithImpl<_PresentersState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PresentersStateToJson(this);
  }
}

abstract class _PresentersState implements PresentersState {
  const factory _PresentersState({@required List<PresenterModel> presenters}) =
      _$_PresentersState;

  factory _PresentersState.fromJson(Map<String, dynamic> json) =
      _$_PresentersState.fromJson;

  @override
  List<PresenterModel> get presenters;
  @override
  @JsonKey(ignore: true)
  _$PresentersStateCopyWith<_PresentersState> get copyWith;
}
