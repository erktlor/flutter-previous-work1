// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'prospector.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ProspectorState _$ProspectorStateFromJson(Map<String, dynamic> json) {
  return _ProspectorState.fromJson(json);
}

/// @nodoc
class _$ProspectorStateTearOff {
  const _$ProspectorStateTearOff();

// ignore: unused_element
  _ProspectorState call(
      {@required int callsDialed,
      @required int callsReached,
      @required int appointments,
      @required List<ProspectorResultModel> results,
      ProspectorSettingsModel settings}) {
    return _ProspectorState(
      callsDialed: callsDialed,
      callsReached: callsReached,
      appointments: appointments,
      results: results,
      settings: settings,
    );
  }

// ignore: unused_element
  ProspectorState fromJson(Map<String, Object> json) {
    return ProspectorState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ProspectorState = _$ProspectorStateTearOff();

/// @nodoc
mixin _$ProspectorState {
  int get callsDialed;
  int get callsReached;
  int get appointments;
  List<ProspectorResultModel> get results;
  ProspectorSettingsModel get settings;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ProspectorStateCopyWith<ProspectorState> get copyWith;
}

/// @nodoc
abstract class $ProspectorStateCopyWith<$Res> {
  factory $ProspectorStateCopyWith(
          ProspectorState value, $Res Function(ProspectorState) then) =
      _$ProspectorStateCopyWithImpl<$Res>;
  $Res call(
      {int callsDialed,
      int callsReached,
      int appointments,
      List<ProspectorResultModel> results,
      ProspectorSettingsModel settings});
}

/// @nodoc
class _$ProspectorStateCopyWithImpl<$Res>
    implements $ProspectorStateCopyWith<$Res> {
  _$ProspectorStateCopyWithImpl(this._value, this._then);

  final ProspectorState _value;
  // ignore: unused_field
  final $Res Function(ProspectorState) _then;

  @override
  $Res call({
    Object callsDialed = freezed,
    Object callsReached = freezed,
    Object appointments = freezed,
    Object results = freezed,
    Object settings = freezed,
  }) {
    return _then(_value.copyWith(
      callsDialed:
          callsDialed == freezed ? _value.callsDialed : callsDialed as int,
      callsReached:
          callsReached == freezed ? _value.callsReached : callsReached as int,
      appointments:
          appointments == freezed ? _value.appointments : appointments as int,
      results: results == freezed
          ? _value.results
          : results as List<ProspectorResultModel>,
      settings: settings == freezed
          ? _value.settings
          : settings as ProspectorSettingsModel,
    ));
  }
}

/// @nodoc
abstract class _$ProspectorStateCopyWith<$Res>
    implements $ProspectorStateCopyWith<$Res> {
  factory _$ProspectorStateCopyWith(
          _ProspectorState value, $Res Function(_ProspectorState) then) =
      __$ProspectorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int callsDialed,
      int callsReached,
      int appointments,
      List<ProspectorResultModel> results,
      ProspectorSettingsModel settings});
}

/// @nodoc
class __$ProspectorStateCopyWithImpl<$Res>
    extends _$ProspectorStateCopyWithImpl<$Res>
    implements _$ProspectorStateCopyWith<$Res> {
  __$ProspectorStateCopyWithImpl(
      _ProspectorState _value, $Res Function(_ProspectorState) _then)
      : super(_value, (v) => _then(v as _ProspectorState));

  @override
  _ProspectorState get _value => super._value as _ProspectorState;

  @override
  $Res call({
    Object callsDialed = freezed,
    Object callsReached = freezed,
    Object appointments = freezed,
    Object results = freezed,
    Object settings = freezed,
  }) {
    return _then(_ProspectorState(
      callsDialed:
          callsDialed == freezed ? _value.callsDialed : callsDialed as int,
      callsReached:
          callsReached == freezed ? _value.callsReached : callsReached as int,
      appointments:
          appointments == freezed ? _value.appointments : appointments as int,
      results: results == freezed
          ? _value.results
          : results as List<ProspectorResultModel>,
      settings: settings == freezed
          ? _value.settings
          : settings as ProspectorSettingsModel,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ProspectorState
    with DiagnosticableTreeMixin
    implements _ProspectorState {
  const _$_ProspectorState(
      {@required this.callsDialed,
      @required this.callsReached,
      @required this.appointments,
      @required this.results,
      this.settings})
      : assert(callsDialed != null),
        assert(callsReached != null),
        assert(appointments != null),
        assert(results != null);

  factory _$_ProspectorState.fromJson(Map<String, dynamic> json) =>
      _$_$_ProspectorStateFromJson(json);

  @override
  final int callsDialed;
  @override
  final int callsReached;
  @override
  final int appointments;
  @override
  final List<ProspectorResultModel> results;
  @override
  final ProspectorSettingsModel settings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProspectorState(callsDialed: $callsDialed, callsReached: $callsReached, appointments: $appointments, results: $results, settings: $settings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProspectorState'))
      ..add(DiagnosticsProperty('callsDialed', callsDialed))
      ..add(DiagnosticsProperty('callsReached', callsReached))
      ..add(DiagnosticsProperty('appointments', appointments))
      ..add(DiagnosticsProperty('results', results))
      ..add(DiagnosticsProperty('settings', settings));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProspectorState &&
            (identical(other.callsDialed, callsDialed) ||
                const DeepCollectionEquality()
                    .equals(other.callsDialed, callsDialed)) &&
            (identical(other.callsReached, callsReached) ||
                const DeepCollectionEquality()
                    .equals(other.callsReached, callsReached)) &&
            (identical(other.appointments, appointments) ||
                const DeepCollectionEquality()
                    .equals(other.appointments, appointments)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality()
                    .equals(other.results, results)) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(callsDialed) ^
      const DeepCollectionEquality().hash(callsReached) ^
      const DeepCollectionEquality().hash(appointments) ^
      const DeepCollectionEquality().hash(results) ^
      const DeepCollectionEquality().hash(settings);

  @JsonKey(ignore: true)
  @override
  _$ProspectorStateCopyWith<_ProspectorState> get copyWith =>
      __$ProspectorStateCopyWithImpl<_ProspectorState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProspectorStateToJson(this);
  }
}

abstract class _ProspectorState implements ProspectorState {
  const factory _ProspectorState(
      {@required int callsDialed,
      @required int callsReached,
      @required int appointments,
      @required List<ProspectorResultModel> results,
      ProspectorSettingsModel settings}) = _$_ProspectorState;

  factory _ProspectorState.fromJson(Map<String, dynamic> json) =
      _$_ProspectorState.fromJson;

  @override
  int get callsDialed;
  @override
  int get callsReached;
  @override
  int get appointments;
  @override
  List<ProspectorResultModel> get results;
  @override
  ProspectorSettingsModel get settings;
  @override
  @JsonKey(ignore: true)
  _$ProspectorStateCopyWith<_ProspectorState> get copyWith;
}
