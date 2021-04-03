// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceModel _$ResourceModelFromJson(Map<String, dynamic> json) {
  return ResourceModel(
    id: json['id'] as String,
    name: json['name'] as String,
    files: (json['files'] as List)
        ?.map((e) =>
            e == null ? null : FileModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResourceModelToJson(ResourceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'files': instance.files,
    };
