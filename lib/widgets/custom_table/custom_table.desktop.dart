import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTableDesktop<T> extends StatelessWidget {
  final List<T> data;
  final List<dynamic> headerCells;
  final List<Function> bodyCells;

  CustomTableDesktop(
      {@required this.data,
      @required this.headerCells,
      @required this.bodyCells});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: AppColors.gray18),
      children: [
        TableRow(decoration: BoxDecoration(color: AppColors.white), children: [
          for (final headerCell in headerCells)
            headerCell is String
                ? buildCellText(context, headerCell)
                : headerCell()
        ]),
        for (final item in data)
          TableRow(
              decoration: BoxDecoration(color: AppColors.white),
              children: [
                for (var i = 0; i < headerCells.length; i++)
                  buildBodyCell(context, i, item)
              ])
      ],
    );
  }

  Widget buildBodyCell(BuildContext context, int index, T item) {
    final bodyCell = bodyCells.elementAt(index)(item);

    if (bodyCell is String) {
      return buildCellText(context, bodyCell);
    }

    return bodyCell;
  }

  Widget buildCellText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 14),
      ),
    );
  }
}
