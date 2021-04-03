// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) {
  return CourseModel(
    id: json['id'] as String,
    name: json['name'] as String,
    videoUri: json['videoUri'] as String,
    featuredImageUri: json['featuredImageUri'] as String,
    text: json['text'] as String,
    published: json['published'] as bool,
    subjects: (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : SubjectModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lessons: (json['lessons'] as List)
        ?.map((e) =>
            e == null ? null : LessonModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    presenters: (json['presenters'] as List)
        ?.map((e) => e == null
            ? null
            : PresenterModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdAt: json['createdAt'] as String,
    publishedAt: json['publishedAt'] as String,
  );
}

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'videoUri': instance.videoUri,
      'featuredImageUri': instance.featuredImageUri,
      'text': instance.text,
      'published': instance.published,
      'subjects': instance.subjects,
      'lessons': instance.lessons,
      'presenters': instance.presenters,
      'createdAt': instance.createdAt,
      'publishedAt': instance.publishedAt,
    };
