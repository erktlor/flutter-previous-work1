// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'onboarding.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) {
  return _OnboardingState.fromJson(json);
}

/// @nodoc
class _$OnboardingStateTearOff {
  const _$OnboardingStateTearOff();

// ignore: unused_element
  _OnboardingState call(
      {@required List<SubjectModel> subjects,
      @required List<SubjectModel> selectedSubjects,
      @required List<AvatarModel> avatars,
      AvatarModel selectedAvatar}) {
    return _OnboardingState(
      subjects: subjects,
      selectedSubjects: selectedSubjects,
      avatars: avatars,
      selectedAvatar: selectedAvatar,
    );
  }

// ignore: unused_element
  OnboardingState fromJson(Map<String, Object> json) {
    return OnboardingState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $OnboardingState = _$OnboardingStateTearOff();

/// @nodoc
mixin _$OnboardingState {
  List<SubjectModel> get subjects;
  List<SubjectModel> get selectedSubjects;
  List<AvatarModel> get avatars;
  AvatarModel get selectedAvatar;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res>;
  $Res call(
      {List<SubjectModel> subjects,
      List<SubjectModel> selectedSubjects,
      List<AvatarModel> avatars,
      AvatarModel selectedAvatar});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  final OnboardingState _value;
  // ignore: unused_field
  final $Res Function(OnboardingState) _then;

  @override
  $Res call({
    Object subjects = freezed,
    Object selectedSubjects = freezed,
    Object avatars = freezed,
    Object selectedAvatar = freezed,
  }) {
    return _then(_value.copyWith(
      subjects: subjects == freezed
          ? _value.subjects
          : subjects as List<SubjectModel>,
      selectedSubjects: selectedSubjects == freezed
          ? _value.selectedSubjects
          : selectedSubjects as List<SubjectModel>,
      avatars:
          avatars == freezed ? _value.avatars : avatars as List<AvatarModel>,
      selectedAvatar: selectedAvatar == freezed
          ? _value.selectedAvatar
          : selectedAvatar as AvatarModel,
    ));
  }
}

/// @nodoc
abstract class _$OnboardingStateCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(
          _OnboardingState value, $Res Function(_OnboardingState) then) =
      __$OnboardingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SubjectModel> subjects,
      List<SubjectModel> selectedSubjects,
      List<AvatarModel> avatars,
      AvatarModel selectedAvatar});
}

/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(
      _OnboardingState _value, $Res Function(_OnboardingState) _then)
      : super(_value, (v) => _then(v as _OnboardingState));

  @override
  _OnboardingState get _value => super._value as _OnboardingState;

  @override
  $Res call({
    Object subjects = freezed,
    Object selectedSubjects = freezed,
    Object avatars = freezed,
    Object selectedAvatar = freezed,
  }) {
    return _then(_OnboardingState(
      subjects: subjects == freezed
          ? _value.subjects
          : subjects as List<SubjectModel>,
      selectedSubjects: selectedSubjects == freezed
          ? _value.selectedSubjects
          : selectedSubjects as List<SubjectModel>,
      avatars:
          avatars == freezed ? _value.avatars : avatars as List<AvatarModel>,
      selectedAvatar: selectedAvatar == freezed
          ? _value.selectedAvatar
          : selectedAvatar as AvatarModel,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_OnboardingState
    with DiagnosticableTreeMixin
    implements _OnboardingState {
  const _$_OnboardingState(
      {@required this.subjects,
      @required this.selectedSubjects,
      @required this.avatars,
      this.selectedAvatar})
      : assert(subjects != null),
        assert(selectedSubjects != null),
        assert(avatars != null);

  factory _$_OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$_$_OnboardingStateFromJson(json);

  @override
  final List<SubjectModel> subjects;
  @override
  final List<SubjectModel> selectedSubjects;
  @override
  final List<AvatarModel> avatars;
  @override
  final AvatarModel selectedAvatar;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnboardingState(subjects: $subjects, selectedSubjects: $selectedSubjects, avatars: $avatars, selectedAvatar: $selectedAvatar)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OnboardingState'))
      ..add(DiagnosticsProperty('subjects', subjects))
      ..add(DiagnosticsProperty('selectedSubjects', selectedSubjects))
      ..add(DiagnosticsProperty('avatars', avatars))
      ..add(DiagnosticsProperty('selectedAvatar', selectedAvatar));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnboardingState &&
            (identical(other.subjects, subjects) ||
                const DeepCollectionEquality()
                    .equals(other.subjects, subjects)) &&
            (identical(other.selectedSubjects, selectedSubjects) ||
                const DeepCollectionEquality()
                    .equals(other.selectedSubjects, selectedSubjects)) &&
            (identical(other.avatars, avatars) ||
                const DeepCollectionEquality()
                    .equals(other.avatars, avatars)) &&
            (identical(other.selectedAvatar, selectedAvatar) ||
                const DeepCollectionEquality()
                    .equals(other.selectedAvatar, selectedAvatar)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(subjects) ^
      const DeepCollectionEquality().hash(selectedSubjects) ^
      const DeepCollectionEquality().hash(avatars) ^
      const DeepCollectionEquality().hash(selectedAvatar);

  @JsonKey(ignore: true)
  @override
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OnboardingStateToJson(this);
  }
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState(
      {@required List<SubjectModel> subjects,
      @required List<SubjectModel> selectedSubjects,
      @required List<AvatarModel> avatars,
      AvatarModel selectedAvatar}) = _$_OnboardingState;

  factory _OnboardingState.fromJson(Map<String, dynamic> json) =
      _$_OnboardingState.fromJson;

  @override
  List<SubjectModel> get subjects;
  @override
  List<SubjectModel> get selectedSubjects;
  @override
  List<AvatarModel> get avatars;
  @override
  AvatarModel get selectedAvatar;
  @override
  @JsonKey(ignore: true)
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith;
}
