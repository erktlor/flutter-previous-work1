// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchState _$_$_SearchStateFromJson(Map<String, dynamic> json) {
  return _$_SearchState(
    searchContentItems: (json['searchContentItems'] as List)
        ?.map((e) => e == null
            ? null
            : SearchContentModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    searchEnabled: json['searchEnabled'] as bool,
  );
}

Map<String, dynamic> _$_$_SearchStateToJson(_$_SearchState instance) =>
    <String, dynamic>{
      'searchContentItems': instance.searchContentItems,
      'searchEnabled': instance.searchEnabled,
    };
