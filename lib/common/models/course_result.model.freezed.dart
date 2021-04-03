// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'course_result.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CourseResultModel _$CourseResultModelFromJson(Map<String, dynamic> json) {
  return _CourseResultModel.fromJson(json);
}

/// @nodoc
class _$CourseResultModelTearOff {
  const _$CourseResultModelTearOff();

// ignore: unused_element
  _CourseResultModel call(
      {@required bool favourite,
      @required bool watched,
      @required String notes,
      @required String updatedAt,
      @required List<LessonResultModel> lessonsResults}) {
    return _CourseResultModel(
      favourite: favourite,
      watched: watched,
      notes: notes,
      updatedAt: updatedAt,
      lessonsResults: lessonsResults,
    );
  }

// ignore: unused_element
  CourseResultModel fromJson(Map<String, Object> json) {
    return CourseResultModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CourseResultModel = _$CourseResultModelTearOff();

/// @nodoc
mixin _$CourseResultModel {
  bool get favourite;
  bool get watched;
  String get notes;
  String get updatedAt;
  List<LessonResultModel> get lessonsResults;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $CourseResultModelCopyWith<CourseResultModel> get copyWith;
}

/// @nodoc
abstract class $CourseResultModelCopyWith<$Res> {
  factory $CourseResultModelCopyWith(
          CourseResultModel value, $Res Function(CourseResultModel) then) =
      _$CourseResultModelCopyWithImpl<$Res>;
  $Res call(
      {bool favourite,
      bool watched,
      String notes,
      String updatedAt,
      List<LessonResultModel> lessonsResults});
}

/// @nodoc
class _$CourseResultModelCopyWithImpl<$Res>
    implements $CourseResultModelCopyWith<$Res> {
  _$CourseResultModelCopyWithImpl(this._value, this._then);

  final CourseResultModel _value;
  // ignore: unused_field
  final $Res Function(CourseResultModel) _then;

  @override
  $Res call({
    Object favourite = freezed,
    Object watched = freezed,
    Object notes = freezed,
    Object updatedAt = freezed,
    Object lessonsResults = freezed,
  }) {
    return _then(_value.copyWith(
      favourite: favourite == freezed ? _value.favourite : favourite as bool,
      watched: watched == freezed ? _value.watched : watched as bool,
      notes: notes == freezed ? _value.notes : notes as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      lessonsResults: lessonsResults == freezed
          ? _value.lessonsResults
          : lessonsResults as List<LessonResultModel>,
    ));
  }
}

/// @nodoc
abstract class _$CourseResultModelCopyWith<$Res>
    implements $CourseResultModelCopyWith<$Res> {
  factory _$CourseResultModelCopyWith(
          _CourseResultModel value, $Res Function(_CourseResultModel) then) =
      __$CourseResultModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool favourite,
      bool watched,
      String notes,
      String updatedAt,
      List<LessonResultModel> lessonsResults});
}

/// @nodoc
class __$CourseResultModelCopyWithImpl<$Res>
    extends _$CourseResultModelCopyWithImpl<$Res>
    implements _$CourseResultModelCopyWith<$Res> {
  __$CourseResultModelCopyWithImpl(
      _CourseResultModel _value, $Res Function(_CourseResultModel) _then)
      : super(_value, (v) => _then(v as _CourseResultModel));

  @override
  _CourseResultModel get _value => super._value as _CourseResultModel;

  @override
  $Res call({
    Object favourite = freezed,
    Object watched = freezed,
    Object notes = freezed,
    Object updatedAt = freezed,
    Object lessonsResults = freezed,
  }) {
    return _then(_CourseResultModel(
      favourite: favourite == freezed ? _value.favourite : favourite as bool,
      watched: watched == freezed ? _value.watched : watched as bool,
      notes: notes == freezed ? _value.notes : notes as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      lessonsResults: lessonsResults == freezed
          ? _value.lessonsResults
          : lessonsResults as List<LessonResultModel>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CourseResultModel extends _CourseResultModel
    with DiagnosticableTreeMixin {
  const _$_CourseResultModel(
      {@required this.favourite,
      @required this.watched,
      @required this.notes,
      @required this.updatedAt,
      @required this.lessonsResults})
      : assert(favourite != null),
        assert(watched != null),
        assert(notes != null),
        assert(updatedAt != null),
        assert(lessonsResults != null),
        super._();

  factory _$_CourseResultModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CourseResultModelFromJson(json);

  @override
  final bool favourite;
  @override
  final bool watched;
  @override
  final String notes;
  @override
  final String updatedAt;
  @override
  final List<LessonResultModel> lessonsResults;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseResultModel(favourite: $favourite, watched: $watched, notes: $notes, updatedAt: $updatedAt, lessonsResults: $lessonsResults)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CourseResultModel'))
      ..add(DiagnosticsProperty('favourite', favourite))
      ..add(DiagnosticsProperty('watched', watched))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('lessonsResults', lessonsResults));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CourseResultModel &&
            (identical(other.favourite, favourite) ||
                const DeepCollectionEquality()
                    .equals(other.favourite, favourite)) &&
            (identical(other.watched, watched) ||
                const DeepCollectionEquality()
                    .equals(other.watched, watched)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.lessonsResults, lessonsResults) ||
                const DeepCollectionEquality()
                    .equals(other.lessonsResults, lessonsResults)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(favourite) ^
      const DeepCollectionEquality().hash(watched) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(lessonsResults);

  @JsonKey(ignore: true)
  @override
  _$CourseResultModelCopyWith<_CourseResultModel> get copyWith =>
      __$CourseResultModelCopyWithImpl<_CourseResultModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CourseResultModelToJson(this);
  }
}

abstract class _CourseResultModel extends CourseResultModel {
  const _CourseResultModel._() : super._();
  const factory _CourseResultModel(
      {@required bool favourite,
      @required bool watched,
      @required String notes,
      @required String updatedAt,
      @required List<LessonResultModel> lessonsResults}) = _$_CourseResultModel;

  factory _CourseResultModel.fromJson(Map<String, dynamic> json) =
      _$_CourseResultModel.fromJson;

  @override
  bool get favourite;
  @override
  bool get watched;
  @override
  String get notes;
  @override
  String get updatedAt;
  @override
  List<LessonResultModel> get lessonsResults;
  @override
  @JsonKey(ignore: true)
  _$CourseResultModelCopyWith<_CourseResultModel> get copyWith;
}
