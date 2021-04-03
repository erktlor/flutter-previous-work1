// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search.types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SearchState _$SearchStateFromJson(Map<String, dynamic> json) {
  return _SearchState.fromJson(json);
}

/// @nodoc
class _$SearchStateTearOff {
  const _$SearchStateTearOff();

// ignore: unused_element
  _SearchState call(
      {@required List<SearchContentModel> searchContentItems,
      @required bool searchEnabled}) {
    return _SearchState(
      searchContentItems: searchContentItems,
      searchEnabled: searchEnabled,
    );
  }

// ignore: unused_element
  SearchState fromJson(Map<String, Object> json) {
    return SearchState.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SearchState = _$SearchStateTearOff();

/// @nodoc
mixin _$SearchState {
  List<SearchContentModel> get searchContentItems;
  bool get searchEnabled;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call({List<SearchContentModel> searchContentItems, bool searchEnabled});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object searchContentItems = freezed,
    Object searchEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      searchContentItems: searchContentItems == freezed
          ? _value.searchContentItems
          : searchContentItems as List<SearchContentModel>,
      searchEnabled: searchEnabled == freezed
          ? _value.searchEnabled
          : searchEnabled as bool,
    ));
  }
}

/// @nodoc
abstract class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) then) =
      __$SearchStateCopyWithImpl<$Res>;
  @override
  $Res call({List<SearchContentModel> searchContentItems, bool searchEnabled});
}

/// @nodoc
class __$SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(
      _SearchState _value, $Res Function(_SearchState) _then)
      : super(_value, (v) => _then(v as _SearchState));

  @override
  _SearchState get _value => super._value as _SearchState;

  @override
  $Res call({
    Object searchContentItems = freezed,
    Object searchEnabled = freezed,
  }) {
    return _then(_SearchState(
      searchContentItems: searchContentItems == freezed
          ? _value.searchContentItems
          : searchContentItems as List<SearchContentModel>,
      searchEnabled: searchEnabled == freezed
          ? _value.searchEnabled
          : searchEnabled as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SearchState with DiagnosticableTreeMixin implements _SearchState {
  const _$_SearchState(
      {@required this.searchContentItems, @required this.searchEnabled})
      : assert(searchContentItems != null),
        assert(searchEnabled != null);

  factory _$_SearchState.fromJson(Map<String, dynamic> json) =>
      _$_$_SearchStateFromJson(json);

  @override
  final List<SearchContentModel> searchContentItems;
  @override
  final bool searchEnabled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchState(searchContentItems: $searchContentItems, searchEnabled: $searchEnabled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchState'))
      ..add(DiagnosticsProperty('searchContentItems', searchContentItems))
      ..add(DiagnosticsProperty('searchEnabled', searchEnabled));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchState &&
            (identical(other.searchContentItems, searchContentItems) ||
                const DeepCollectionEquality()
                    .equals(other.searchContentItems, searchContentItems)) &&
            (identical(other.searchEnabled, searchEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.searchEnabled, searchEnabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchContentItems) ^
      const DeepCollectionEquality().hash(searchEnabled);

  @JsonKey(ignore: true)
  @override
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SearchStateToJson(this);
  }
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {@required List<SearchContentModel> searchContentItems,
      @required bool searchEnabled}) = _$_SearchState;

  factory _SearchState.fromJson(Map<String, dynamic> json) =
      _$_SearchState.fromJson;

  @override
  List<SearchContentModel> get searchContentItems;
  @override
  bool get searchEnabled;
  @override
  @JsonKey(ignore: true)
  _$SearchStateCopyWith<_SearchState> get copyWith;
}
