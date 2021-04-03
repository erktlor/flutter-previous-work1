// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'podcast_result.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PodcastResultModel _$PodcastResultModelFromJson(Map<String, dynamic> json) {
  return _PodcastResultModel.fromJson(json);
}

/// @nodoc
class _$PodcastResultModelTearOff {
  const _$PodcastResultModelTearOff();

// ignore: unused_element
  _PodcastResultModel call(
      {@required bool favourite,
      @required bool watched,
      @required String notes}) {
    return _PodcastResultModel(
      favourite: favourite,
      watched: watched,
      notes: notes,
    );
  }

// ignore: unused_element
  PodcastResultModel fromJson(Map<String, Object> json) {
    return PodcastResultModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PodcastResultModel = _$PodcastResultModelTearOff();

/// @nodoc
mixin _$PodcastResultModel {
  bool get favourite;
  bool get watched;
  String get notes;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $PodcastResultModelCopyWith<PodcastResultModel> get copyWith;
}

/// @nodoc
abstract class $PodcastResultModelCopyWith<$Res> {
  factory $PodcastResultModelCopyWith(
          PodcastResultModel value, $Res Function(PodcastResultModel) then) =
      _$PodcastResultModelCopyWithImpl<$Res>;
  $Res call({bool favourite, bool watched, String notes});
}

/// @nodoc
class _$PodcastResultModelCopyWithImpl<$Res>
    implements $PodcastResultModelCopyWith<$Res> {
  _$PodcastResultModelCopyWithImpl(this._value, this._then);

  final PodcastResultModel _value;
  // ignore: unused_field
  final $Res Function(PodcastResultModel) _then;

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
abstract class _$PodcastResultModelCopyWith<$Res>
    implements $PodcastResultModelCopyWith<$Res> {
  factory _$PodcastResultModelCopyWith(
          _PodcastResultModel value, $Res Function(_PodcastResultModel) then) =
      __$PodcastResultModelCopyWithImpl<$Res>;
  @override
  $Res call({bool favourite, bool watched, String notes});
}

/// @nodoc
class __$PodcastResultModelCopyWithImpl<$Res>
    extends _$PodcastResultModelCopyWithImpl<$Res>
    implements _$PodcastResultModelCopyWith<$Res> {
  __$PodcastResultModelCopyWithImpl(
      _PodcastResultModel _value, $Res Function(_PodcastResultModel) _then)
      : super(_value, (v) => _then(v as _PodcastResultModel));

  @override
  _PodcastResultModel get _value => super._value as _PodcastResultModel;

  @override
  $Res call({
    Object favourite = freezed,
    Object watched = freezed,
    Object notes = freezed,
  }) {
    return _then(_PodcastResultModel(
      favourite: favourite == freezed ? _value.favourite : favourite as bool,
      watched: watched == freezed ? _value.watched : watched as bool,
      notes: notes == freezed ? _value.notes : notes as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_PodcastResultModel
    with DiagnosticableTreeMixin
    implements _PodcastResultModel {
  const _$_PodcastResultModel(
      {@required this.favourite, @required this.watched, @required this.notes})
      : assert(favourite != null),
        assert(watched != null),
        assert(notes != null);

  factory _$_PodcastResultModel.fromJson(Map<String, dynamic> json) =>
      _$_$_PodcastResultModelFromJson(json);

  @override
  final bool favourite;
  @override
  final bool watched;
  @override
  final String notes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PodcastResultModel(favourite: $favourite, watched: $watched, notes: $notes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PodcastResultModel'))
      ..add(DiagnosticsProperty('favourite', favourite))
      ..add(DiagnosticsProperty('watched', watched))
      ..add(DiagnosticsProperty('notes', notes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PodcastResultModel &&
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
  _$PodcastResultModelCopyWith<_PodcastResultModel> get copyWith =>
      __$PodcastResultModelCopyWithImpl<_PodcastResultModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PodcastResultModelToJson(this);
  }
}

abstract class _PodcastResultModel implements PodcastResultModel {
  const factory _PodcastResultModel(
      {@required bool favourite,
      @required bool watched,
      @required String notes}) = _$_PodcastResultModel;

  factory _PodcastResultModel.fromJson(Map<String, dynamic> json) =
      _$_PodcastResultModel.fromJson;

  @override
  bool get favourite;
  @override
  bool get watched;
  @override
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$PodcastResultModelCopyWith<_PodcastResultModel> get copyWith;
}
