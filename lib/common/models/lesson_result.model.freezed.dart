// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lesson_result.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
LessonResultModel _$LessonResultModelFromJson(Map<String, dynamic> json) {
  return _LessonResultModel.fromJson(json);
}

/// @nodoc
class _$LessonResultModelTearOff {
  const _$LessonResultModelTearOff();

// ignore: unused_element
  _LessonResultModel call(
      {@required String id,
      @required String lessonId,
      @required bool favourite,
      @required bool watched,
      @required String notes,
      @required String updatedAt,
      @required List<TopicResultModel> topicsResults}) {
    return _LessonResultModel(
      id: id,
      lessonId: lessonId,
      favourite: favourite,
      watched: watched,
      notes: notes,
      updatedAt: updatedAt,
      topicsResults: topicsResults,
    );
  }

// ignore: unused_element
  LessonResultModel fromJson(Map<String, Object> json) {
    return LessonResultModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $LessonResultModel = _$LessonResultModelTearOff();

/// @nodoc
mixin _$LessonResultModel {
  String get id;
  String get lessonId;
  bool get favourite;
  bool get watched;
  String get notes;
  String get updatedAt;
  List<TopicResultModel> get topicsResults;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $LessonResultModelCopyWith<LessonResultModel> get copyWith;
}

/// @nodoc
abstract class $LessonResultModelCopyWith<$Res> {
  factory $LessonResultModelCopyWith(
          LessonResultModel value, $Res Function(LessonResultModel) then) =
      _$LessonResultModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String lessonId,
      bool favourite,
      bool watched,
      String notes,
      String updatedAt,
      List<TopicResultModel> topicsResults});
}

/// @nodoc
class _$LessonResultModelCopyWithImpl<$Res>
    implements $LessonResultModelCopyWith<$Res> {
  _$LessonResultModelCopyWithImpl(this._value, this._then);

  final LessonResultModel _value;
  // ignore: unused_field
  final $Res Function(LessonResultModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object lessonId = freezed,
    Object favourite = freezed,
    Object watched = freezed,
    Object notes = freezed,
    Object updatedAt = freezed,
    Object topicsResults = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      lessonId: lessonId == freezed ? _value.lessonId : lessonId as String,
      favourite: favourite == freezed ? _value.favourite : favourite as bool,
      watched: watched == freezed ? _value.watched : watched as bool,
      notes: notes == freezed ? _value.notes : notes as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      topicsResults: topicsResults == freezed
          ? _value.topicsResults
          : topicsResults as List<TopicResultModel>,
    ));
  }
}

/// @nodoc
abstract class _$LessonResultModelCopyWith<$Res>
    implements $LessonResultModelCopyWith<$Res> {
  factory _$LessonResultModelCopyWith(
          _LessonResultModel value, $Res Function(_LessonResultModel) then) =
      __$LessonResultModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String lessonId,
      bool favourite,
      bool watched,
      String notes,
      String updatedAt,
      List<TopicResultModel> topicsResults});
}

/// @nodoc
class __$LessonResultModelCopyWithImpl<$Res>
    extends _$LessonResultModelCopyWithImpl<$Res>
    implements _$LessonResultModelCopyWith<$Res> {
  __$LessonResultModelCopyWithImpl(
      _LessonResultModel _value, $Res Function(_LessonResultModel) _then)
      : super(_value, (v) => _then(v as _LessonResultModel));

  @override
  _LessonResultModel get _value => super._value as _LessonResultModel;

  @override
  $Res call({
    Object id = freezed,
    Object lessonId = freezed,
    Object favourite = freezed,
    Object watched = freezed,
    Object notes = freezed,
    Object updatedAt = freezed,
    Object topicsResults = freezed,
  }) {
    return _then(_LessonResultModel(
      id: id == freezed ? _value.id : id as String,
      lessonId: lessonId == freezed ? _value.lessonId : lessonId as String,
      favourite: favourite == freezed ? _value.favourite : favourite as bool,
      watched: watched == freezed ? _value.watched : watched as bool,
      notes: notes == freezed ? _value.notes : notes as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      topicsResults: topicsResults == freezed
          ? _value.topicsResults
          : topicsResults as List<TopicResultModel>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_LessonResultModel extends _LessonResultModel
    with DiagnosticableTreeMixin {
  const _$_LessonResultModel(
      {@required this.id,
      @required this.lessonId,
      @required this.favourite,
      @required this.watched,
      @required this.notes,
      @required this.updatedAt,
      @required this.topicsResults})
      : assert(id != null),
        assert(lessonId != null),
        assert(favourite != null),
        assert(watched != null),
        assert(notes != null),
        assert(updatedAt != null),
        assert(topicsResults != null),
        super._();

  factory _$_LessonResultModel.fromJson(Map<String, dynamic> json) =>
      _$_$_LessonResultModelFromJson(json);

  @override
  final String id;
  @override
  final String lessonId;
  @override
  final bool favourite;
  @override
  final bool watched;
  @override
  final String notes;
  @override
  final String updatedAt;
  @override
  final List<TopicResultModel> topicsResults;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonResultModel(id: $id, lessonId: $lessonId, favourite: $favourite, watched: $watched, notes: $notes, updatedAt: $updatedAt, topicsResults: $topicsResults)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonResultModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('lessonId', lessonId))
      ..add(DiagnosticsProperty('favourite', favourite))
      ..add(DiagnosticsProperty('watched', watched))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('topicsResults', topicsResults));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LessonResultModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.lessonId, lessonId) ||
                const DeepCollectionEquality()
                    .equals(other.lessonId, lessonId)) &&
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
            (identical(other.topicsResults, topicsResults) ||
                const DeepCollectionEquality()
                    .equals(other.topicsResults, topicsResults)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(lessonId) ^
      const DeepCollectionEquality().hash(favourite) ^
      const DeepCollectionEquality().hash(watched) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(topicsResults);

  @JsonKey(ignore: true)
  @override
  _$LessonResultModelCopyWith<_LessonResultModel> get copyWith =>
      __$LessonResultModelCopyWithImpl<_LessonResultModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LessonResultModelToJson(this);
  }
}

abstract class _LessonResultModel extends LessonResultModel {
  const _LessonResultModel._() : super._();
  const factory _LessonResultModel(
      {@required String id,
      @required String lessonId,
      @required bool favourite,
      @required bool watched,
      @required String notes,
      @required String updatedAt,
      @required List<TopicResultModel> topicsResults}) = _$_LessonResultModel;

  factory _LessonResultModel.fromJson(Map<String, dynamic> json) =
      _$_LessonResultModel.fromJson;

  @override
  String get id;
  @override
  String get lessonId;
  @override
  bool get favourite;
  @override
  bool get watched;
  @override
  String get notes;
  @override
  String get updatedAt;
  @override
  List<TopicResultModel> get topicsResults;
  @override
  @JsonKey(ignore: true)
  _$LessonResultModelCopyWith<_LessonResultModel> get copyWith;
}
