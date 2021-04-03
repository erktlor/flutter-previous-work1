// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'resources.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ResourcesState _$ResourcesStateFromJson(Map<String, dynamic> json) {
  return _ResourcesState.fromJson(json);
}

/// @nodoc
class _$ResourcesStateTearOff {
  const _$ResourcesStateTearOff();

// ignore: unused_element
  _ResourcesState call({@required List<ResourceModel> resources}) {
    return _ResourcesState(
      resources: resources,
    );
  }

// ignore: unused_element
  ResourcesState fromJson(Map<String, Object> json) {
    return ResourcesState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ResourcesState = _$ResourcesStateTearOff();

/// @nodoc
mixin _$ResourcesState {
  List<ResourceModel> get resources;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ResourcesStateCopyWith<ResourcesState> get copyWith;
}

/// @nodoc
abstract class $ResourcesStateCopyWith<$Res> {
  factory $ResourcesStateCopyWith(
          ResourcesState value, $Res Function(ResourcesState) then) =
      _$ResourcesStateCopyWithImpl<$Res>;
  $Res call({List<ResourceModel> resources});
}

/// @nodoc
class _$ResourcesStateCopyWithImpl<$Res>
    implements $ResourcesStateCopyWith<$Res> {
  _$ResourcesStateCopyWithImpl(this._value, this._then);

  final ResourcesState _value;
  // ignore: unused_field
  final $Res Function(ResourcesState) _then;

  @override
  $Res call({
    Object resources = freezed,
  }) {
    return _then(_value.copyWith(
      resources: resources == freezed
          ? _value.resources
          : resources as List<ResourceModel>,
    ));
  }
}

/// @nodoc
abstract class _$ResourcesStateCopyWith<$Res>
    implements $ResourcesStateCopyWith<$Res> {
  factory _$ResourcesStateCopyWith(
          _ResourcesState value, $Res Function(_ResourcesState) then) =
      __$ResourcesStateCopyWithImpl<$Res>;
  @override
  $Res call({List<ResourceModel> resources});
}

/// @nodoc
class __$ResourcesStateCopyWithImpl<$Res>
    extends _$ResourcesStateCopyWithImpl<$Res>
    implements _$ResourcesStateCopyWith<$Res> {
  __$ResourcesStateCopyWithImpl(
      _ResourcesState _value, $Res Function(_ResourcesState) _then)
      : super(_value, (v) => _then(v as _ResourcesState));

  @override
  _ResourcesState get _value => super._value as _ResourcesState;

  @override
  $Res call({
    Object resources = freezed,
  }) {
    return _then(_ResourcesState(
      resources: resources == freezed
          ? _value.resources
          : resources as List<ResourceModel>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ResourcesState
    with DiagnosticableTreeMixin
    implements _ResourcesState {
  const _$_ResourcesState({@required this.resources})
      : assert(resources != null);

  factory _$_ResourcesState.fromJson(Map<String, dynamic> json) =>
      _$_$_ResourcesStateFromJson(json);

  @override
  final List<ResourceModel> resources;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResourcesState(resources: $resources)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResourcesState'))
      ..add(DiagnosticsProperty('resources', resources));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResourcesState &&
            (identical(other.resources, resources) ||
                const DeepCollectionEquality()
                    .equals(other.resources, resources)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(resources);

  @JsonKey(ignore: true)
  @override
  _$ResourcesStateCopyWith<_ResourcesState> get copyWith =>
      __$ResourcesStateCopyWithImpl<_ResourcesState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ResourcesStateToJson(this);
  }
}

abstract class _ResourcesState implements ResourcesState {
  const factory _ResourcesState({@required List<ResourceModel> resources}) =
      _$_ResourcesState;

  factory _ResourcesState.fromJson(Map<String, dynamic> json) =
      _$_ResourcesState.fromJson;

  @override
  List<ResourceModel> get resources;
  @override
  @JsonKey(ignore: true)
  _$ResourcesStateCopyWith<_ResourcesState> get copyWith;
}
