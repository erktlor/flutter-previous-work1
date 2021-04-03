// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileModel _$FileModelFromJson(Map<String, dynamic> json) {
  return FileModel(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    type: json['type'] as String,
    fileUri: json['fileUri'] as String,
  );
}

Map<String, dynamic> _$FileModelToJson(FileModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'fileUri': instance.fileUri,
    };
