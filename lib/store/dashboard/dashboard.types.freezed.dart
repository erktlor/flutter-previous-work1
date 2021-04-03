// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dashboard.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DashboardState _$DashboardStateFromJson(Map<String, dynamic> json) {
  return _DashboardState.fromJson(json);
}

/// @nodoc
class _$DashboardStateTearOff {
  const _$DashboardStateTearOff();

// ignore: unused_element
  _DashboardState call({@required List<DashboardVideoModel> videos}) {
    return _DashboardState(
      videos: videos,
    );
  }

// ignore: unused_element
  DashboardState fromJson(Map<String, Object> json) {
    return DashboardState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DashboardState = _$DashboardStateTearOff();

/// @nodoc
mixin _$DashboardState {
  List<DashboardVideoModel> get videos;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res>;
  $Res call({List<DashboardVideoModel> videos});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  final DashboardState _value;
  // ignore: unused_field
  final $Res Function(DashboardState) _then;

  @override
  $Res call({
    Object videos = freezed,
  }) {
    return _then(_value.copyWith(
      videos: videos == freezed
          ? _value.videos
          : videos as List<DashboardVideoModel>,
    ));
  }
}

/// @nodoc
abstract class _$DashboardStateCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(
          _DashboardState value, $Res Function(_DashboardState) then) =
      __$DashboardStateCopyWithImpl<$Res>;
  @override
  $Res call({List<DashboardVideoModel> videos});
}

/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(
      _DashboardState _value, $Res Function(_DashboardState) _then)
      : super(_value, (v) => _then(v as _DashboardState));

  @override
  _DashboardState get _value => super._value as _DashboardState;

  @override
  $Res call({
    Object videos = freezed,
  }) {
    return _then(_DashboardState(
      videos: videos == freezed
          ? _value.videos
          : videos as List<DashboardVideoModel>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DashboardState
    with DiagnosticableTreeMixin
    implements _DashboardState {
  const _$_DashboardState({@required this.videos}) : assert(videos != null);

  factory _$_DashboardState.fromJson(Map<String, dynamic> json) =>
      _$_$_DashboardStateFromJson(json);

  @override
  final List<DashboardVideoModel> videos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DashboardState(videos: $videos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DashboardState'))
      ..add(DiagnosticsProperty('videos', videos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DashboardState &&
            (identical(other.videos, videos) ||
                const DeepCollectionEquality().equals(other.videos, videos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(videos);

  @JsonKey(ignore: true)
  @override
  _$DashboardStateCopyWith<_DashboardState> get copyWith =>
      __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DashboardStateToJson(this);
  }
}

abstract class _DashboardState implements DashboardState {
  const factory _DashboardState({@required List<DashboardVideoModel> videos}) =
      _$_DashboardState;

  factory _DashboardState.fromJson(Map<String, dynamic> json) =
      _$_DashboardState.fromJson;

  @override
  List<DashboardVideoModel> get videos;
  @override
  @JsonKey(ignore: true)
  _$DashboardStateCopyWith<_DashboardState> get copyWith;
}
