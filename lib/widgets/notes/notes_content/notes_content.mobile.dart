import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/notes_content.model.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/notes/notes_content/notes_table.dart';

class NotesContentMobile extends StatelessWidget {
  final List<NotesContentModel> notes;
  final bool loading;

  NotesContentMobile({@required this.notes, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavigationBar(),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                loading
                    ? const LinearProgressIndicator()
                    : NotesTable(notes: notes),
              ],
            ),
          )
        ],
      ),
    );
  }
}
