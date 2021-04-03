import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/notes_content.model.dart';
import 'package:dart_date/dart_date.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesList extends StatelessWidget {
  final List<NotesContentModel> notes;

  NotesList({@required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return buildItem(notes.elementAt(index));
      },
      separatorBuilder: (_, __) => const SizedBox(
        height: 10,
      ),
    );
  }

  Widget buildItem(NotesContentModel note) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.3))]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildRow('Page name', note.name),
          const SizedBox(
            height: 10,
          ),
          buildRow('Note', note.notes),
          const SizedBox(
            height: 10,
          ),
          buildRow(
              'Date Created',
              DateTime.parse(note.createdAt)
                  .toLocal()
                  .format('dd/MM/yyyy hh:mm a')),
          const SizedBox(
            height: 10,
          ),
          buildRow(
              'Date Updated',
              DateTime.parse(note.updatedAt)
                  .toLocal()
                  .format('dd/MM/yyyy hh:mm a')),
        ],
      ),
    );
  }

  Widget buildRow(String name, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            flex: 1,
            child: Text(
              name,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 14),
            )),
        Flexible(
            flex: 2,
            child: Text(value,
                textAlign: TextAlign.right,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 14)))
      ],
    );
  }
}
