// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotesSuccessAction _$GetNotesSuccessActionFromJson(
    Map<String, dynamic> json) {
  return GetNotesSuccessAction(
    notes: (json['notes'] as List)
        ?.map((e) => e == null
            ? null
            : NotesContentModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetNotesSuccessActionToJson(
        GetNotesSuccessAction instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };
