import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/notes_content.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes.actions.g.dart';

// Get notes
class GetNotesAction {}

class GetNotesRequestAction {}

@JsonSerializable()
class GetNotesSuccessAction {
  final List<NotesContentModel> notes;

  GetNotesSuccessAction({@required this.notes});

  factory GetNotesSuccessAction.fromJson(Map<String, dynamic> json) =>
      _$GetNotesSuccessActionFromJson(json);
  Map<String, dynamic> toJson() => _$GetNotesSuccessActionToJson(this);
}

class GetNotesFailureAction {}
