// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notes.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
NotesState _$NotesStateFromJson(Map<String, dynamic> json) {
  return _NotesState.fromJson(json);
}

/// @nodoc
class _$NotesStateTearOff {
  const _$NotesStateTearOff();

// ignore: unused_element
  _NotesState call({@required List<NotesContentModel> notes}) {
    return _NotesState(
      notes: notes,
    );
  }

// ignore: unused_element
  NotesState fromJson(Map<String, Object> json) {
    return NotesState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $NotesState = _$NotesStateTearOff();

/// @nodoc
mixin _$NotesState {
  List<NotesContentModel> get notes;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $NotesStateCopyWith<NotesState> get copyWith;
}

/// @nodoc
abstract class $NotesStateCopyWith<$Res> {
  factory $NotesStateCopyWith(
          NotesState value, $Res Function(NotesState) then) =
      _$NotesStateCopyWithImpl<$Res>;
  $Res call({List<NotesContentModel> notes});
}

/// @nodoc
class _$NotesStateCopyWithImpl<$Res> implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._value, this._then);

  final NotesState _value;
  // ignore: unused_field
  final $Res Function(NotesState) _then;

  @override
  $Res call({
    Object notes = freezed,
  }) {
    return _then(_value.copyWith(
      notes: notes == freezed ? _value.notes : notes as List<NotesContentModel>,
    ));
  }
}

/// @nodoc
abstract class _$NotesStateCopyWith<$Res> implements $NotesStateCopyWith<$Res> {
  factory _$NotesStateCopyWith(
          _NotesState value, $Res Function(_NotesState) then) =
      __$NotesStateCopyWithImpl<$Res>;
  @override
  $Res call({List<NotesContentModel> notes});
}

/// @nodoc
class __$NotesStateCopyWithImpl<$Res> extends _$NotesStateCopyWithImpl<$Res>
    implements _$NotesStateCopyWith<$Res> {
  __$NotesStateCopyWithImpl(
      _NotesState _value, $Res Function(_NotesState) _then)
      : super(_value, (v) => _then(v as _NotesState));

  @override
  _NotesState get _value => super._value as _NotesState;

  @override
  $Res call({
    Object notes = freezed,
  }) {
    return _then(_NotesState(
      notes: notes == freezed ? _value.notes : notes as List<NotesContentModel>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_NotesState with DiagnosticableTreeMixin implements _NotesState {
  const _$_NotesState({@required this.notes}) : assert(notes != null);

  factory _$_NotesState.fromJson(Map<String, dynamic> json) =>
      _$_$_NotesStateFromJson(json);

  @override
  final List<NotesContentModel> notes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotesState(notes: $notes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotesState'))
      ..add(DiagnosticsProperty('notes', notes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotesState &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(notes);

  @JsonKey(ignore: true)
  @override
  _$NotesStateCopyWith<_NotesState> get copyWith =>
      __$NotesStateCopyWithImpl<_NotesState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotesStateToJson(this);
  }
}

abstract class _NotesState implements NotesState {
  const factory _NotesState({@required List<NotesContentModel> notes}) =
      _$_NotesState;

  factory _NotesState.fromJson(Map<String, dynamic> json) =
      _$_NotesState.fromJson;

  @override
  List<NotesContentModel> get notes;
  @override
  @JsonKey(ignore: true)
  _$NotesStateCopyWith<_NotesState> get copyWith;
}
