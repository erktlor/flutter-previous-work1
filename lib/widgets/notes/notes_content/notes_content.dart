import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/notes_content.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/notes/notes_content/notes_content.desktop.dart';
import 'package:flutter_web_app/widgets/notes/notes_content/notes_content.mobile.dart';

class NotesContent extends StatelessWidget {
  final List<NotesContentModel> notes;
  final bool loading;

  NotesContent({@required this.notes, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? NotesContentMobile(
            notes: notes,
            loading: loading,
          )
        : NotesContentDesktop(
            notes: notes,
            loading: loading,
          );
  }
}
