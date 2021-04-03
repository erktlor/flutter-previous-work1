// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'podcasts.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PodcastsState _$PodcastsStateFromJson(Map<String, dynamic> json) {
  return _PodcastsState.fromJson(json);
}

/// @nodoc
class _$PodcastsStateTearOff {
  const _$PodcastsStateTearOff();

// ignore: unused_element
  _PodcastsState call(
      {@required List<SearchContentModel> searchPodcasts,
      PodcastModel podcast,
      PodcastResultModel podcastResult}) {
    return _PodcastsState(
      searchPodcasts: searchPodcasts,
      podcast: podcast,
      podcastResult: podcastResult,
    );
  }

// ignore: unused_element
  PodcastsState fromJson(Map<String, Object> json) {
    return PodcastsState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PodcastsState = _$PodcastsStateTearOff();

/// @nodoc
mixin _$PodcastsState {
  List<SearchContentModel> get searchPodcasts;
  PodcastModel get podcast;
  PodcastResultModel get podcastResult;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $PodcastsStateCopyWith<PodcastsState> get copyWith;
}

/// @nodoc
abstract class $PodcastsStateCopyWith<$Res> {
  factory $PodcastsStateCopyWith(
          PodcastsState value, $Res Function(PodcastsState) then) =
      _$PodcastsStateCopyWithImpl<$Res>;
  $Res call(
      {List<SearchContentModel> searchPodcasts,
      PodcastModel podcast,
      PodcastResultModel podcastResult});

  $PodcastResultModelCopyWith<$Res> get podcastResult;
}

/// @nodoc
class _$PodcastsStateCopyWithImpl<$Res>
    implements $PodcastsStateCopyWith<$Res> {
  _$PodcastsStateCopyWithImpl(this._value, this._then);

  final PodcastsState _value;
  // ignore: unused_field
  final $Res Function(PodcastsState) _then;

  @override
  $Res call({
    Object searchPodcasts = freezed,
    Object podcast = freezed,
    Object podcastResult = freezed,
  }) {
    return _then(_value.copyWith(
      searchPodcasts: searchPodcasts == freezed
          ? _value.searchPodcasts
          : searchPodcasts as List<SearchContentModel>,
      podcast: podcast == freezed ? _value.podcast : podcast as PodcastModel,
      podcastResult: podcastResult == freezed
          ? _value.podcastResult
          : podcastResult as PodcastResultModel,
    ));
  }

  @override
  $PodcastResultModelCopyWith<$Res> get podcastResult {
    if (_value.podcastResult == null) {
      return null;
    }
    return $PodcastResultModelCopyWith<$Res>(_value.podcastResult, (value) {
      return _then(_value.copyWith(podcastResult: value));
    });
  }
}

/// @nodoc
abstract class _$PodcastsStateCopyWith<$Res>
    implements $PodcastsStateCopyWith<$Res> {
  factory _$PodcastsStateCopyWith(
          _PodcastsState value, $Res Function(_PodcastsState) then) =
      __$PodcastsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SearchContentModel> searchPodcasts,
      PodcastModel podcast,
      PodcastResultModel podcastResult});

  @override
  $PodcastResultModelCopyWith<$Res> get podcastResult;
}

/// @nodoc
class __$PodcastsStateCopyWithImpl<$Res>
    extends _$PodcastsStateCopyWithImpl<$Res>
    implements _$PodcastsStateCopyWith<$Res> {
  __$PodcastsStateCopyWithImpl(
      _PodcastsState _value, $Res Function(_PodcastsState) _then)
      : super(_value, (v) => _then(v as _PodcastsState));

  @override
  _PodcastsState get _value => super._value as _PodcastsState;

  @override
  $Res call({
    Object searchPodcasts = freezed,
    Object podcast = freezed,
    Object podcastResult = freezed,
  }) {
    return _then(_PodcastsState(
      searchPodcasts: searchPodcasts == freezed
          ? _value.searchPodcasts
          : searchPodcasts as List<SearchContentModel>,
      podcast: podcast == freezed ? _value.podcast : podcast as PodcastModel,
      podcastResult: podcastResult == freezed
          ? _value.podcastResult
          : podcastResult as PodcastResultModel,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_PodcastsState with DiagnosticableTreeMixin implements _PodcastsState {
  const _$_PodcastsState(
      {@required this.searchPodcasts, this.podcast, this.podcastResult})
      : assert(searchPodcasts != null);

  factory _$_PodcastsState.fromJson(Map<String, dynamic> json) =>
      _$_$_PodcastsStateFromJson(json);

  @override
  final List<SearchContentModel> searchPodcasts;
  @override
  final PodcastModel podcast;
  @override
  final PodcastResultModel podcastResult;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PodcastsState(searchPodcasts: $searchPodcasts, podcast: $podcast, podcastResult: $podcastResult)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PodcastsState'))
      ..add(DiagnosticsProperty('searchPodcasts', searchPodcasts))
      ..add(DiagnosticsProperty('podcast', podcast))
      ..add(DiagnosticsProperty('podcastResult', podcastResult));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PodcastsState &&
            (identical(other.searchPodcasts, searchPodcasts) ||
                const DeepCollectionEquality()
                    .equals(other.searchPodcasts, searchPodcasts)) &&
            (identical(other.podcast, podcast) ||
                const DeepCollectionEquality()
                    .equals(other.podcast, podcast)) &&
            (identical(other.podcastResult, podcastResult) ||
                const DeepCollectionEquality()
                    .equals(other.podcastResult, podcastResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchPodcasts) ^
      const DeepCollectionEquality().hash(podcast) ^
      const DeepCollectionEquality().hash(podcastResult);

  @JsonKey(ignore: true)
  @override
  _$PodcastsStateCopyWith<_PodcastsState> get copyWith =>
      __$PodcastsStateCopyWithImpl<_PodcastsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PodcastsStateToJson(this);
  }
}

abstract class _PodcastsState implements PodcastsState {
  const factory _PodcastsState(
      {@required List<SearchContentModel> searchPodcasts,
      PodcastModel podcast,
      PodcastResultModel podcastResult}) = _$_PodcastsState;

  factory _PodcastsState.fromJson(Map<String, dynamic> json) =
      _$_PodcastsState.fromJson;

  @override
  List<SearchContentModel> get searchPodcasts;
  @override
  PodcastModel get podcast;
  @override
  PodcastResultModel get podcastResult;
  @override
  @JsonKey(ignore: true)
  _$PodcastsStateCopyWith<_PodcastsState> get copyWith;
}
