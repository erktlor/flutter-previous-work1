// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presenter.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresenterModel _$PresenterModelFromJson(Map<String, dynamic> json) {
  return PresenterModel(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    photoUri: json['photoUri'] as String,
  );
}

Map<String, dynamic> _$PresenterModelToJson(PresenterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUri': instance.photoUri,
    };
