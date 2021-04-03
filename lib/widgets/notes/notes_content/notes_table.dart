import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/notes_content.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/custom_table/custom_table.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dart_date/dart_date.dart';

class NotesTable extends StatefulWidget {
  final List<NotesContentModel> notes;

  NotesTable({@required this.notes});

  @override
  _NotesTableState createState() => _NotesTableState();
}

class _NotesTableState extends State<NotesTable> {
  String sortColumn;
  bool asc = false;
  String search = '';

  final List<String> headerColumnNames = [
    'Page Name',
    'Note',
    'Date Created',
    'Date Modified'
  ];

  @override
  void initState() {
    super.initState();

    sortColumn = headerColumnNames[2];
  }

  get sortedNotes {
    List<NotesContentModel> notes = []..addAll(widget.notes);

    if (search.isNotEmpty) {
      final lowerSearch = search.toLowerCase();

      notes = notes.where((element) {
        return element.name.toLowerCase().contains(lowerSearch) ||
            element.notes.contains(lowerSearch);
      }).toList();
    }

    // Page name
    if (sortColumn == headerColumnNames[0]) {
      notes.sort((first, second) => first.name.compareTo(second.name));
      // Note
    } else if (sortColumn == headerColumnNames[1]) {
      notes.sort((first, second) => first.notes.compareTo(second.notes));
      // Date created
    } else if (sortColumn == headerColumnNames[2]) {
      notes.sort((first, second) => DateTime.parse(first.createdAt)
          .compareTo(DateTime.parse(second.createdAt)));
      // Date modified
    } else if (sortColumn == headerColumnNames[3]) {
      notes.sort((first, second) => DateTime.parse(first.updatedAt)
          .compareTo(DateTime.parse(second.updatedAt)));
    }

    if (!asc) {
      return notes.reversed.toList();
    } else {
      return notes;
    }
  }

  Widget buildSortArrow() {
    return Icon(
      asc ? Icons.arrow_drop_up : Icons.arrow_drop_down,
      color: AppColors.black,
    );
  }

  onChanged(String value) {
    setState(() {
      search = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle =
        GoogleFonts.poppins(fontSize: 24, color: AppColors.gray10);

    final mobile = isMobile(context);

    return Column(
      children: [
        TextField(
          onChanged: onChanged,
          style: textStyle,
          decoration: InputDecoration(
              fillColor: AppColors.white,
              hoverColor: AppColors.white,
              filled: true,
              border: InputBorder.none,
              hintText: 'Search notes',
              hintStyle: textStyle),
        ),
        const SizedBox(height: 20),
        CustomTable(
          data: sortedNotes,
          headerCells: [
            for (final name in headerColumnNames)
              () => TextButton(
                    onPressed: () {
                      if (sortColumn != name) {
                        setState(() {
                          sortColumn = name;
                          asc = true;
                        });
                      } else {
                        setState(() {
                          asc = !asc;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              name,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Opacity(
                            child: buildSortArrow(),
                            opacity: sortColumn == name ? 1 : 0,
                          )
                        ],
                      ),
                    ),
                  )
          ],
          bodyCells: [
            (note) => TextButton(
                  child: Row(
                    mainAxisAlignment: mobile
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: buildCellText(note.name,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  onPressed: () {
                    String route;

                    if (note.type == 'interview') {
                      route = Routes.interview;
                    } else if (note.type == 'podcast') {
                      route = Routes.podcast;
                    } else if (note.type == 'course') {
                      route = Routes.course;
                    } else if (note.type == 'lesson') {
                      route = Routes.lesson;
                    } else if (note.type == 'topic') {
                      route = Routes.topic;
                    }

                    if (route != null) {
                      final path = route + '?' + note.parameters;
                      navigatorKey.currentState.pushReplacementNamed(path);
                    }
                  },
                ),
            (note) => note.notes,
            (note) => DateTime.parse(note.createdAt)
                .toLocal()
                .format('dd/MM/yyyy hh:mm a'),
            (note) => DateTime.parse(note.updatedAt)
                .toLocal()
                .format('dd/MM/yyyy hh:mm a'),
          ],
        ),
      ],
    );
  }

  Widget buildCellText(String text, {TextDecoration decoration}) {
    final mobile = isMobile(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: mobile ? TextAlign.right : TextAlign.left,
        style: GoogleFonts.poppins(
            decoration: decoration,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.gray3),
      ),
    );
  }
}
