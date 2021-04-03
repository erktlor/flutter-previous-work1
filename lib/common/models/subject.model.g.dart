// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) {
  return SubjectModel(
    id: json['id'] as String,
    name: json['name'] as String,
    imageUri: json['imageUri'] as String,
  );
}

Map<String, dynamic> _$SubjectModelToJson(SubjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUri': instance.imageUri,
    };
