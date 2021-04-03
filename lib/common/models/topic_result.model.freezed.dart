// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'topic_result.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TopicResultModel _$TopicResultModelFromJson(Map<String, dynamic> json) {
  return _TopicResultModel.fromJson(json);
}

/// @nodoc
class _$TopicResultModelTearOff {
  const _$TopicResultModelTearOff();

// ignore: unused_element
  _TopicResultModel call(
      {@required String topicId,
      @required bool favourite,
      @required bool watched,
      @required String notes,
      @required String updatedAt,
      @required List<FileModel> files}) {
    return _TopicResultModel(
      topicId: topicId,
      favourite: favourite,
      watched: watched,
      notes: notes,
      updatedAt: updatedAt,
      files: files,
    );
  }

// ignore: unused_element
  TopicResultModel fromJson(Map<String, Object> json) {
    return TopicResultModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $TopicResultModel = _$TopicResultModelTearOff();

/// @nodoc
mixin _$TopicResultModel {
  String get topicId;
  bool get favourite;
  bool get watched;
  String get notes;
  String get updatedAt;
  List<FileModel> get files;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $TopicResultModelCopyWith<TopicResultModel> get copyWith;
}

/// @nodoc
abstract class $TopicResultModelCopyWith<$Res> {
  factory $TopicResultModelCopyWith(
          TopicResultModel value, $Res Function(TopicResultModel) then) =
      _$TopicResultModelCopyWithImpl<$Res>;
  $Res call(
      {String topicId,
      bool favourite,
      bool watched,
      String notes,
      String updatedAt,
      List<FileModel> files});
}

/// @nodoc
class _$TopicResultModelCopyWithImpl<$Res>
    implements $TopicResultModelCopyWith<$Res> {
  _$TopicResultModelCopyWithImpl(this._value, this._then);

  final TopicResultModel _value;
  // ignore: unused_field
  final $Res Function(TopicResultModel) _then;

  @override
  $Res call({
    Object topicId = freezed,
    Object favourite = freezed,
    Object watched = freezed,
    Object notes = freezed,
    Object updatedAt = freezed,
    Object files = freezed,
  }) {
    return _then(_value.copyWith(
      topicId: topicId == freezed ? _value.topicId : topicId as String,
      favourite: favourite == freezed ? _value.favourite : favourite as bool,
      watched: watched == freezed ? _value.watched : watched as bool,
      notes: notes == freezed ? _value.notes : notes as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      files: files == freezed ? _value.files : files as List<FileModel>,
    ));
  }
}

/// @nodoc
abstract class _$TopicResultModelCopyWith<$Res>
    implements $TopicResultModelCopyWith<$Res> {
  factory _$TopicResultModelCopyWith(
          _TopicResultModel value, $Res Function(_TopicResultModel) then) =
      __$TopicResultModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String topicId,
      bool favourite,
      bool watched,
      String notes,
      String updatedAt,
      List<FileModel> files});
}

/// @nodoc
class __$TopicResultModelCopyWithImpl<$Res>
    extends _$TopicResultModelCopyWithImpl<$Res>
    implements _$TopicResultModelCopyWith<$Res> {
  __$TopicResultModelCopyWithImpl(
      _TopicResultModel _value, $Res Function(_TopicResultModel) _then)
      : super(_value, (v) => _then(v as _TopicResultModel));

  @override
  _TopicResultModel get _value => super._value as _TopicResultModel;

  @override
  $Res call({
    Object topicId = freezed,
    Object favourite = freezed,
    Object watched = freezed,
    Object notes = freezed,
    Object updatedAt = freezed,
    Object files = freezed,
  }) {
    return _then(_TopicResultModel(
      topicId: topicId == freezed ? _value.topicId : topicId as String,
      favourite: favourite == freezed ? _value.favourite : favourite as bool,
      watched: watched == freezed ? _value.watched : watched as bool,
      notes: notes == freezed ? _value.notes : notes as String,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String,
      files: files == freezed ? _value.files : files as List<FileModel>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_TopicResultModel
    with DiagnosticableTreeMixin
    implements _TopicResultModel {
  const _$_TopicResultModel(
      {@required this.topicId,
      @required this.favourite,
      @required this.watched,
      @required this.notes,
      @required this.updatedAt,
      @required this.files})
      : assert(topicId != null),
        assert(favourite != null),
        assert(watched != null),
        assert(notes != null),
        assert(updatedAt != null),
        assert(files != null);

  factory _$_TopicResultModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TopicResultModelFromJson(json);

  @override
  final String topicId;
  @override
  final bool favourite;
  @override
  final bool watched;
  @override
  final String notes;
  @override
  final String updatedAt;
  @override
  final List<FileModel> files;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TopicResultModel(topicId: $topicId, favourite: $favourite, watched: $watched, notes: $notes, updatedAt: $updatedAt, files: $files)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TopicResultModel'))
      ..add(DiagnosticsProperty('topicId', topicId))
      ..add(DiagnosticsProperty('favourite', favourite))
      ..add(DiagnosticsProperty('watched', watched))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TopicResultModel &&
            (identical(other.topicId, topicId) ||
                const DeepCollectionEquality()
                    .equals(other.topicId, topicId)) &&
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
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(topicId) ^
      const DeepCollectionEquality().hash(favourite) ^
      const DeepCollectionEquality().hash(watched) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(files);

  @JsonKey(ignore: true)
  @override
  _$TopicResultModelCopyWith<_TopicResultModel> get copyWith =>
      __$TopicResultModelCopyWithImpl<_TopicResultModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TopicResultModelToJson(this);
  }
}

abstract class _TopicResultModel implements TopicResultModel {
  const factory _TopicResultModel(
      {@required String topicId,
      @required bool favourite,
      @required bool watched,
      @required String notes,
      @required String updatedAt,
      @required List<FileModel> files}) = _$_TopicResultModel;

  factory _TopicResultModel.fromJson(Map<String, dynamic> json) =
      _$_TopicResultModel.fromJson;

  @override
  String get topicId;
  @override
  bool get favourite;
  @override
  bool get watched;
  @override
  String get notes;
  @override
  String get updatedAt;
  @override
  List<FileModel> get files;
  @override
  @JsonKey(ignore: true)
  _$TopicResultModelCopyWith<_TopicResultModel> get copyWith;
}
