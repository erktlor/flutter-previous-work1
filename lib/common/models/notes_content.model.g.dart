// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_content.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotesContentModel _$NotesContentModelFromJson(Map<String, dynamic> json) {
  return NotesContentModel(
    type: json['type'] as String,
    name: json['name'] as String,
    notes: json['notes'] as String,
    parameters: json['parameters'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$NotesContentModelToJson(NotesContentModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'notes': instance.notes,
      'parameters': instance.parameters,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
