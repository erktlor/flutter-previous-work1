// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_content_count.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsContentCountModel _$SubjectsContentCountModelFromJson(
    Map<String, dynamic> json) {
  return SubjectsContentCountModel(
    subject: json['subject'] == null
        ? null
        : SubjectModel.fromJson(json['subject'] as Map<String, dynamic>),
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$SubjectsContentCountModelToJson(
        SubjectsContentCountModel instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'count': instance.count,
    };
