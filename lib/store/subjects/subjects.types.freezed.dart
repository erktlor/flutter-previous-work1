// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'subjects.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SubjectsState _$SubjectsStateFromJson(Map<String, dynamic> json) {
  return _SubjectsState.fromJson(json);
}

/// @nodoc
class _$SubjectsStateTearOff {
  const _$SubjectsStateTearOff();

// ignore: unused_element
  _SubjectsState call(
      {@required List<SubjectsContentCountModel> subjectsContentCount}) {
    return _SubjectsState(
      subjectsContentCount: subjectsContentCount,
    );
  }

// ignore: unused_element
  SubjectsState fromJson(Map<String, Object> json) {
    return SubjectsState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SubjectsState = _$SubjectsStateTearOff();

/// @nodoc
mixin _$SubjectsState {
  List<SubjectsContentCountModel> get subjectsContentCount;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SubjectsStateCopyWith<SubjectsState> get copyWith;
}

/// @nodoc
abstract class $SubjectsStateCopyWith<$Res> {
  factory $SubjectsStateCopyWith(
          SubjectsState value, $Res Function(SubjectsState) then) =
      _$SubjectsStateCopyWithImpl<$Res>;
  $Res call({List<SubjectsContentCountModel> subjectsContentCount});
}

/// @nodoc
class _$SubjectsStateCopyWithImpl<$Res>
    implements $SubjectsStateCopyWith<$Res> {
  _$SubjectsStateCopyWithImpl(this._value, this._then);

  final SubjectsState _value;
  // ignore: unused_field
  final $Res Function(SubjectsState) _then;

  @override
  $Res call({
    Object subjectsContentCount = freezed,
  }) {
    return _then(_value.copyWith(
      subjectsContentCount: subjectsContentCount == freezed
          ? _value.subjectsContentCount
          : subjectsContentCount as List<SubjectsContentCountModel>,
    ));
  }
}

/// @nodoc
abstract class _$SubjectsStateCopyWith<$Res>
    implements $SubjectsStateCopyWith<$Res> {
  factory _$SubjectsStateCopyWith(
          _SubjectsState value, $Res Function(_SubjectsState) then) =
      __$SubjectsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<SubjectsContentCountModel> subjectsContentCount});
}

/// @nodoc
class __$SubjectsStateCopyWithImpl<$Res>
    extends _$SubjectsStateCopyWithImpl<$Res>
    implements _$SubjectsStateCopyWith<$Res> {
  __$SubjectsStateCopyWithImpl(
      _SubjectsState _value, $Res Function(_SubjectsState) _then)
      : super(_value, (v) => _then(v as _SubjectsState));

  @override
  _SubjectsState get _value => super._value as _SubjectsState;

  @override
  $Res call({
    Object subjectsContentCount = freezed,
  }) {
    return _then(_SubjectsState(
      subjectsContentCount: subjectsContentCount == freezed
          ? _value.subjectsContentCount
          : subjectsContentCount as List<SubjectsContentCountModel>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SubjectsState with DiagnosticableTreeMixin implements _SubjectsState {
  const _$_SubjectsState({@required this.subjectsContentCount})
      : assert(subjectsContentCount != null);

  factory _$_SubjectsState.fromJson(Map<String, dynamic> json) =>
      _$_$_SubjectsStateFromJson(json);

  @override
  final List<SubjectsContentCountModel> subjectsContentCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubjectsState(subjectsContentCount: $subjectsContentCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubjectsState'))
      ..add(DiagnosticsProperty('subjectsContentCount', subjectsContentCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubjectsState &&
            (identical(other.subjectsContentCount, subjectsContentCount) ||
                const DeepCollectionEquality()
                    .equals(other.subjectsContentCount, subjectsContentCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(subjectsContentCount);

  @JsonKey(ignore: true)
  @override
  _$SubjectsStateCopyWith<_SubjectsState> get copyWith =>
      __$SubjectsStateCopyWithImpl<_SubjectsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubjectsStateToJson(this);
  }
}

abstract class _SubjectsState implements SubjectsState {
  const factory _SubjectsState(
          {@required List<SubjectsContentCountModel> subjectsContentCount}) =
      _$_SubjectsState;

  factory _SubjectsState.fromJson(Map<String, dynamic> json) =
      _$_SubjectsState.fromJson;

  @override
  List<SubjectsContentCountModel> get subjectsContentCount;
  @override
  @JsonKey(ignore: true)
  _$SubjectsStateCopyWith<_SubjectsState> get copyWith;
}
