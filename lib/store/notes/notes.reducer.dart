import 'package:flutter_web_app/store/notes/notes.actions.dart';
import 'package:flutter_web_app/store/notes/notes.types.dart';

NotesState notesReducer(NotesState state, action) {
  if (action is GetNotesAction) {
    return state.copyWith(notes: []);
  }

  if (action is GetNotesSuccessAction) {
    return state.copyWith(notes: action.notes);
  }

  return state;
}
