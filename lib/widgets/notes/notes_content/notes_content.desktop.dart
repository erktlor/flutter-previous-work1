import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/notes_content.model.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_web_app/widgets/notes/notes_content/notes_table.dart';

class NotesContentDesktop extends StatelessWidget {
  final List<NotesContentModel> notes;
  final bool loading;

  NotesContentDesktop({@required this.notes, @required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBar(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: AppColors.gray11, width: 1))),
              child: Column(
                children: [
                  loading
                      ? const LinearProgressIndicator()
                      : NotesTable(notes: notes),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
