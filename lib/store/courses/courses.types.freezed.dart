// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'courses.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CoursesState _$CoursesStateFromJson(Map<String, dynamic> json) {
  return _CoursesState.fromJson(json);
}

/// @nodoc
class _$CoursesStateTearOff {
  const _$CoursesStateTearOff();

// ignore: unused_element
  _CoursesState call(
      {@required List<SearchContentModel> searchCourses,
      CourseModel course,
      CourseResultModel courseResult}) {
    return _CoursesState(
      searchCourses: searchCourses,
      course: course,
      courseResult: courseResult,
    );
  }

// ignore: unused_element
  CoursesState fromJson(Map<String, Object> json) {
    return CoursesState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CoursesState = _$CoursesStateTearOff();

/// @nodoc
mixin _$CoursesState {
  List<SearchContentModel> get searchCourses;
  CourseModel get course;
  CourseResultModel get courseResult;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $CoursesStateCopyWith<CoursesState> get copyWith;
}

/// @nodoc
abstract class $CoursesStateCopyWith<$Res> {
  factory $CoursesStateCopyWith(
          CoursesState value, $Res Function(CoursesState) then) =
      _$CoursesStateCopyWithImpl<$Res>;
  $Res call(
      {List<SearchContentModel> searchCourses,
      CourseModel course,
      CourseResultModel courseResult});

  $CourseResultModelCopyWith<$Res> get courseResult;
}

/// @nodoc
class _$CoursesStateCopyWithImpl<$Res> implements $CoursesStateCopyWith<$Res> {
  _$CoursesStateCopyWithImpl(this._value, this._then);

  final CoursesState _value;
  // ignore: unused_field
  final $Res Function(CoursesState) _then;

  @override
  $Res call({
    Object searchCourses = freezed,
    Object course = freezed,
    Object courseResult = freezed,
  }) {
    return _then(_value.copyWith(
      searchCourses: searchCourses == freezed
          ? _value.searchCourses
          : searchCourses as List<SearchContentModel>,
      course: course == freezed ? _value.course : course as CourseModel,
      courseResult: courseResult == freezed
          ? _value.courseResult
          : courseResult as CourseResultModel,
    ));
  }

  @override
  $CourseResultModelCopyWith<$Res> get courseResult {
    if (_value.courseResult == null) {
      return null;
    }
    return $CourseResultModelCopyWith<$Res>(_value.courseResult, (value) {
      return _then(_value.copyWith(courseResult: value));
    });
  }
}

/// @nodoc
abstract class _$CoursesStateCopyWith<$Res>
    implements $CoursesStateCopyWith<$Res> {
  factory _$CoursesStateCopyWith(
          _CoursesState value, $Res Function(_CoursesState) then) =
      __$CoursesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SearchContentModel> searchCourses,
      CourseModel course,
      CourseResultModel courseResult});

  @override
  $CourseResultModelCopyWith<$Res> get courseResult;
}

/// @nodoc
class __$CoursesStateCopyWithImpl<$Res> extends _$CoursesStateCopyWithImpl<$Res>
    implements _$CoursesStateCopyWith<$Res> {
  __$CoursesStateCopyWithImpl(
      _CoursesState _value, $Res Function(_CoursesState) _then)
      : super(_value, (v) => _then(v as _CoursesState));

  @override
  _CoursesState get _value => super._value as _CoursesState;

  @override
  $Res call({
    Object searchCourses = freezed,
    Object course = freezed,
    Object courseResult = freezed,
  }) {
    return _then(_CoursesState(
      searchCourses: searchCourses == freezed
          ? _value.searchCourses
          : searchCourses as List<SearchContentModel>,
      course: course == freezed ? _value.course : course as CourseModel,
      courseResult: courseResult == freezed
          ? _value.courseResult
          : courseResult as CourseResultModel,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CoursesState with DiagnosticableTreeMixin implements _CoursesState {
  const _$_CoursesState(
      {@required this.searchCourses, this.course, this.courseResult})
      : assert(searchCourses != null);

  factory _$_CoursesState.fromJson(Map<String, dynamic> json) =>
      _$_$_CoursesStateFromJson(json);

  @override
  final List<SearchContentModel> searchCourses;
  @override
  final CourseModel course;
  @override
  final CourseResultModel courseResult;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoursesState(searchCourses: $searchCourses, course: $course, courseResult: $courseResult)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoursesState'))
      ..add(DiagnosticsProperty('searchCourses', searchCourses))
      ..add(DiagnosticsProperty('course', course))
      ..add(DiagnosticsProperty('courseResult', courseResult));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CoursesState &&
            (identical(other.searchCourses, searchCourses) ||
                const DeepCollectionEquality()
                    .equals(other.searchCourses, searchCourses)) &&
            (identical(other.course, course) ||
                const DeepCollectionEquality().equals(other.course, course)) &&
            (identical(other.courseResult, courseResult) ||
                const DeepCollectionEquality()
                    .equals(other.courseResult, courseResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchCourses) ^
      const DeepCollectionEquality().hash(course) ^
      const DeepCollectionEquality().hash(courseResult);

  @JsonKey(ignore: true)
  @override
  _$CoursesStateCopyWith<_CoursesState> get copyWith =>
      __$CoursesStateCopyWithImpl<_CoursesState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CoursesStateToJson(this);
  }
}

abstract class _CoursesState implements CoursesState {
  const factory _CoursesState(
      {@required List<SearchContentModel> searchCourses,
      CourseModel course,
      CourseResultModel courseResult}) = _$_CoursesState;

  factory _CoursesState.fromJson(Map<String, dynamic> json) =
      _$_CoursesState.fromJson;

  @override
  List<SearchContentModel> get searchCourses;
  @override
  CourseModel get course;
  @override
  CourseResultModel get courseResult;
  @override
  @JsonKey(ignore: true)
  _$CoursesStateCopyWith<_CoursesState> get copyWith;
}
