// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotesState _$_$_NotesStateFromJson(Map<String, dynamic> json) {
  return _$_NotesState(
    notes: (json['notes'] as List)
        ?.map((e) => e == null
            ? null
            : NotesContentModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_NotesStateToJson(_$_NotesState instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };
