// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResourcesState _$_$_ResourcesStateFromJson(Map<String, dynamic> json) {
  return _$_ResourcesState(
    resources: (json['resources'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ResourcesStateToJson(_$_ResourcesState instance) =>
    <String, dynamic>{
      'resources': instance.resources,
    };
