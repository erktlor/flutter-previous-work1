// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'interviews.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
InterviewsState _$InterviewsStateFromJson(Map<String, dynamic> json) {
  return _InterviewsState.fromJson(json);
}

/// @nodoc
class _$InterviewsStateTearOff {
  const _$InterviewsStateTearOff();

// ignore: unused_element
  _InterviewsState call(
      {@required List<SearchInterviewModel> interviews,
      InterviewModel interview,
      InterviewResultModel interviewResult,
      @required bool kickstartVisible}) {
    return _InterviewsState(
      interviews: interviews,
      interview: interview,
      interviewResult: interviewResult,
      kickstartVisible: kickstartVisible,
    );
  }

// ignore: unused_element
  InterviewsState fromJson(Map<String, Object> json) {
    return InterviewsState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $InterviewsState = _$InterviewsStateTearOff();

/// @nodoc
mixin _$InterviewsState {
  List<SearchInterviewModel> get interviews;
  InterviewModel get interview;
  InterviewResultModel get interviewResult;
  bool get kickstartVisible;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $InterviewsStateCopyWith<InterviewsState> get copyWith;
}

/// @nodoc
abstract class $InterviewsStateCopyWith<$Res> {
  factory $InterviewsStateCopyWith(
          InterviewsState value, $Res Function(InterviewsState) then) =
      _$InterviewsStateCopyWithImpl<$Res>;
  $Res call(
      {List<SearchInterviewModel> interviews,
      InterviewModel interview,
      InterviewResultModel interviewResult,
      bool kickstartVisible});

  $InterviewResultModelCopyWith<$Res> get interviewResult;
}

/// @nodoc
class _$InterviewsStateCopyWithImpl<$Res>
    implements $InterviewsStateCopyWith<$Res> {
  _$InterviewsStateCopyWithImpl(this._value, this._then);

  final InterviewsState _value;
  // ignore: unused_field
  final $Res Function(InterviewsState) _then;

  @override
  $Res call({
    Object interviews = freezed,
    Object interview = freezed,
    Object interviewResult = freezed,
    Object kickstartVisible = freezed,
  }) {
    return _then(_value.copyWith(
      interviews: interviews == freezed
          ? _value.interviews
          : interviews as List<SearchInterviewModel>,
      interview:
          interview == freezed ? _value.interview : interview as InterviewModel,
      interviewResult: interviewResult == freezed
          ? _value.interviewResult
          : interviewResult as InterviewResultModel,
      kickstartVisible: kickstartVisible == freezed
          ? _value.kickstartVisible
          : kickstartVisible as bool,
    ));
  }

  @override
  $InterviewResultModelCopyWith<$Res> get interviewResult {
    if (_value.interviewResult == null) {
      return null;
    }
    return $InterviewResultModelCopyWith<$Res>(_value.interviewResult, (value) {
      return _then(_value.copyWith(interviewResult: value));
    });
  }
}

/// @nodoc
abstract class _$InterviewsStateCopyWith<$Res>
    implements $InterviewsStateCopyWith<$Res> {
  factory _$InterviewsStateCopyWith(
          _InterviewsState value, $Res Function(_InterviewsState) then) =
      __$InterviewsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SearchInterviewModel> interviews,
      InterviewModel interview,
      InterviewResultModel interviewResult,
      bool kickstartVisible});

  @override
  $InterviewResultModelCopyWith<$Res> get interviewResult;
}

/// @nodoc
class __$InterviewsStateCopyWithImpl<$Res>
    extends _$InterviewsStateCopyWithImpl<$Res>
    implements _$InterviewsStateCopyWith<$Res> {
  __$InterviewsStateCopyWithImpl(
      _InterviewsState _value, $Res Function(_InterviewsState) _then)
      : super(_value, (v) => _then(v as _InterviewsState));

  @override
  _InterviewsState get _value => super._value as _InterviewsState;

  @override
  $Res call({
    Object interviews = freezed,
    Object interview = freezed,
    Object interviewResult = freezed,
    Object kickstartVisible = freezed,
  }) {
    return _then(_InterviewsState(
      interviews: interviews == freezed
          ? _value.interviews
          : interviews as List<SearchInterviewModel>,
      interview:
          interview == freezed ? _value.interview : interview as InterviewModel,
      interviewResult: interviewResult == freezed
          ? _value.interviewResult
          : interviewResult as InterviewResultModel,
      kickstartVisible: kickstartVisible == freezed
          ? _value.kickstartVisible
          : kickstartVisible as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_InterviewsState
    with DiagnosticableTreeMixin
    implements _InterviewsState {
  const _$_InterviewsState(
      {@required this.interviews,
      this.interview,
      this.interviewResult,
      @required this.kickstartVisible})
      : assert(interviews != null),
        assert(kickstartVisible != null);

  factory _$_InterviewsState.fromJson(Map<String, dynamic> json) =>
      _$_$_InterviewsStateFromJson(json);

  @override
  final List<SearchInterviewModel> interviews;
  @override
  final InterviewModel interview;
  @override
  final InterviewResultModel interviewResult;
  @override
  final bool kickstartVisible;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InterviewsState(interviews: $interviews, interview: $interview, interviewResult: $interviewResult, kickstartVisible: $kickstartVisible)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InterviewsState'))
      ..add(DiagnosticsProperty('interviews', interviews))
      ..add(DiagnosticsProperty('interview', interview))
      ..add(DiagnosticsProperty('interviewResult', interviewResult))
      ..add(DiagnosticsProperty('kickstartVisible', kickstartVisible));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InterviewsState &&
            (identical(other.interviews, interviews) ||
                const DeepCollectionEquality()
                    .equals(other.interviews, interviews)) &&
            (identical(other.interview, interview) ||
                const DeepCollectionEquality()
                    .equals(other.interview, interview)) &&
            (identical(other.interviewResult, interviewResult) ||
                const DeepCollectionEquality()
                    .equals(other.interviewResult, interviewResult)) &&
            (identical(other.kickstartVisible, kickstartVisible) ||
                const DeepCollectionEquality()
                    .equals(other.kickstartVisible, kickstartVisible)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(interviews) ^
      const DeepCollectionEquality().hash(interview) ^
      const DeepCollectionEquality().hash(interviewResult) ^
      const DeepCollectionEquality().hash(kickstartVisible);

  @JsonKey(ignore: true)
  @override
  _$InterviewsStateCopyWith<_InterviewsState> get copyWith =>
      __$InterviewsStateCopyWithImpl<_InterviewsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_InterviewsStateToJson(this);
  }
}

abstract class _InterviewsState implements InterviewsState {
  const factory _InterviewsState(
      {@required List<SearchInterviewModel> interviews,
      InterviewModel interview,
      InterviewResultModel interviewResult,
      @required bool kickstartVisible}) = _$_InterviewsState;

  factory _InterviewsState.fromJson(Map<String, dynamic> json) =
      _$_InterviewsState.fromJson;

  @override
  List<SearchInterviewModel> get interviews;
  @override
  InterviewModel get interview;
  @override
  InterviewResultModel get interviewResult;
  @override
  bool get kickstartVisible;
  @override
  @JsonKey(ignore: true)
  _$InterviewsStateCopyWith<_InterviewsState> get copyWith;
}
