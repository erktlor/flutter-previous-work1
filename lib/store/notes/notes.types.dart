import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/notes_content.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes.types.freezed.dart';
part 'notes.types.g.dart';

@freezed
abstract class NotesState with _$NotesState {
  const factory NotesState({@required List<NotesContentModel> notes}) =
      _NotesState;

  factory NotesState.initialState() => NotesState(notes: []);

  factory NotesState.fromJson(Map<String, dynamic> json) =>
      _$NotesStateFromJson(json);
}
