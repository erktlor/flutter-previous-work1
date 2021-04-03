import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/notes_content.model.dart';
import 'package:flutter_web_app/store/notes/notes.actions.dart';
import 'package:flutter_web_app/store/notes/notes.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/notes/notes_content/notes_content.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:redux/redux.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _NotesProps>(
      onInitialBuild: (props) {
        props.getNotes();
      },
      builder: (context, props) {
        return Scaffold(
          body: PageLayout(
            header: AuthorizedHeader(),
            child: NotesContent(
                notes: props.notes, loading: props.isFetchingNotes),
          ),
        );
      },
      converter: _NotesProps.fromStore,
      distinct: true,
    );
  }
}

class _NotesProps extends Equatable {
  final List<NotesContentModel> notes;
  final VoidCallback getNotes;
  final bool isFetchingNotes;

  _NotesProps(
      {@required this.notes,
      @required this.isFetchingNotes,
      @required this.getNotes});

  static _NotesProps fromStore(Store<ApplicationState> store) {
    return _NotesProps(
        notes: notesSelector(store.state),
        isFetchingNotes: isFetchingNotesSelector(store.state),
        getNotes: () {
          store.dispatch(GetNotesAction());
        });
  }

  @override
  List<Object> get props => [notes, isFetchingNotes];
}
