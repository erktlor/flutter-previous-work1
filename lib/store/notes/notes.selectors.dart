import 'package:flutter_web_app/common/models/notes_content.model.dart';
import 'package:flutter_web_app/store/loading/loading.selectors.dart';
import 'package:flutter_web_app/store/notes/notes.actions.dart';
import 'package:flutter_web_app/store/store.dart';

List<NotesContentModel> notesSelector(ApplicationState state) {
  return state.notes.notes;
}

bool isFetchingNotesSelector(ApplicationState state) {
  return createLoadingSelector([GetNotesAction])(state);
}
