import 'package:dio/dio.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/models/notes_content.model.dart';
import 'package:flutter_web_app/store/notes/notes.actions.dart';
import 'package:redux_saga/redux_saga.dart';

_handleGetNotes({GetNotesAction action}) sync* {
  yield Try(() sync* {
    yield Put(GetNotesRequestAction());

    final result = Result<Response>();

    yield Call(Api.getNotes, result: result);

    List<NotesContentModel> notes = result.value.data
        .map<NotesContentModel>(
            (jsonItem) => NotesContentModel.fromJson(jsonItem))
        .toList();

    yield Put(GetNotesSuccessAction(notes: notes));
  }, Catch: (e, s) sync* {
    yield Put(GetNotesFailureAction());
  });
}

_watchGetNotes() sync* {
  yield TakeLeading(_handleGetNotes, pattern: GetNotesAction);
}

notesSaga() sync* {
  yield Fork(_watchGetNotes);
}
