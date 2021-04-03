// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'interview_result.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
InterviewResultModel _$InterviewResultModelFromJson(Map<String, dynamic> json) {
  return _InterviewResultModel.fromJson(json);
}

/// @nodoc
class _$InterviewResultModelTearOff {
  const _$InterviewResultModelTearOff();

// ignore: unused_element
  _InterviewResultModel call(
      {@required bool favourite,
      @required bool watched,
      @required String notes}) {
    return _InterviewResultModel(
      favourite: favourite,
      watched: watched,
      notes: notes,
    );
  }

// ignore: unused_element
  InterviewResultModel fromJson(Map<String, Object> json) {
    return InterviewResultModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $InterviewResultModel = _$InterviewResultModelTearOff();

/// @nodoc
mixin _$InterviewResultModel {
  bool get favourite;
  bool get watched;
  String get notes;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $InterviewResultModelCopyWith<InterviewResultModel> get copyWith;
}

/// @nodoc
abstract class $InterviewResultModelCopyWith<$Res> {
  factory $InterviewResultModelCopyWith(InterviewResultModel value,
          $Res Function(InterviewResultModel) then) =
      _$InterviewResultModelCopyWithImpl<$Res>;
  $Res call({bool favourite, bool watched, String notes});
}

/// @nodoc
class _$InterviewResultModelCopyWithImpl<$Res>
    implements $InterviewResultModelCopyWith<$Res> {
  _$InterviewResultModelCopyWithImpl(this._value, this._then);

  final InterviewResultModel _value;
  // ignore: unused_field
  final $Res Function(InterviewResultModel) _then;

  @override
  $Res call({
    Object favourite = freezed,
    Object watched = freezed,
    Object notes = freezed,
  }) {
    return _then(_value.copyWith(
      favourite: favourite == freezed ? _value.favourite : favourite as bool,
      watched: watched == freezed ? _value.watched : watched as bool,
      notes: notes == freezed ? _value.notes : notes as String,
    ));
  }
}

/// @nodoc
abstract class _$InterviewResultModelCopyWith<$Res>
    implements $InterviewResultModelCopyWith<$Res> {
  factory _$InterviewResultModelCopyWith(_InterviewResultModel value,
          $Res Function(_InterviewResultModel) then) =
      __$InterviewResultModelCopyWithImpl<$Res>;
  @override
  $Res call({bool favourite, bool watched, String notes});
}

/// @nodoc
class __$InterviewResultModelCopyWithImpl<$Res>
    extends _$InterviewResultModelCopyWithImpl<$Res>
    implements _$InterviewResultModelCopyWith<$Res> {
  __$InterviewResultModelCopyWithImpl(
      _InterviewResultModel _value, $Res Function(_InterviewResultModel) _then)
      : super(_value, (v) => _then(v as _InterviewResultModel));

  @override
  _InterviewResultModel get _value => super._value as _InterviewResultModel;

  @override
  $Res call({
    Object favourite = freezed,
    Object watched = freezed,
    Object notes = freezed,
  }) {
    return _then(_InterviewResultModel(
      favourite: favourite == freezed ? _value.favourite : favourite as bool,
      watched: watched == freezed ? _value.watched : watched as bool,
      notes: notes == freezed ? _value.notes : notes as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_InterviewResultModel
    with DiagnosticableTreeMixin
    implements _InterviewResultModel {
  const _$_InterviewResultModel(
      {@required this.favourite, @required this.watched, @required this.notes})
      : assert(favourite != null),
        assert(watched != null),
        assert(notes != null);

  factory _$_InterviewResultModel.fromJson(Map<String, dynamic> json) =>
      _$_$_InterviewResultModelFromJson(json);

  @override
  final bool favourite;
  @override
  final bool watched;
  @override
  final String notes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InterviewResultModel(favourite: $favourite, watched: $watched, notes: $notes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InterviewResultModel'))
      ..add(DiagnosticsProperty('favourite', favourite))
      ..add(DiagnosticsProperty('watched', watched))
      ..add(DiagnosticsProperty('notes', notes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InterviewResultModel &&
            (identical(other.favourite, favourite) ||
                const DeepCollectionEquality()
                    .equals(other.favourite, favourite)) &&
            (identical(other.watched, watched) ||
                const DeepCollectionEquality()
                    .equals(other.watched, watched)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(favourite) ^
      const DeepCollectionEquality().hash(watched) ^
      const DeepCollectionEquality().hash(notes);

  @JsonKey(ignore: true)
  @override
  _$InterviewResultModelCopyWith<_InterviewResultModel> get copyWith =>
      __$InterviewResultModelCopyWithImpl<_InterviewResultModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_InterviewResultModelToJson(this);
  }
}

abstract class _InterviewResultModel implements InterviewResultModel {
  const factory _InterviewResultModel(
      {@required bool favourite,
      @required bool watched,
      @required String notes}) = _$_InterviewResultModel;

  factory _InterviewResultModel.fromJson(Map<String, dynamic> json) =
      _$_InterviewResultModel.fromJson;

  @override
  bool get favourite;
  @override
  bool get watched;
  @override
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$InterviewResultModelCopyWith<_InterviewResultModel> get copyWith;
}
