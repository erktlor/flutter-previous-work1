// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvatarModel _$AvatarModelFromJson(Map<String, dynamic> json) {
  return AvatarModel(
    id: json['id'] as String,
    name: json['name'] as String,
    imageUri: json['imageUri'] as String,
  );
}

Map<String, dynamic> _$AvatarModelToJson(AvatarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUri': instance.imageUri,
    };
