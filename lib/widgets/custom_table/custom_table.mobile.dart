import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTableMobile<T> extends StatelessWidget {
  final List<T> data;
  final List<dynamic> headerCells;
  final List<Function> bodyCells;

  CustomTableMobile(
      {@required this.data,
      @required this.headerCells,
      @required this.bodyCells});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return buildItem(context, index);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.3))]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < headerCells.length; i++)
            Container(
              margin:
                  EdgeInsets.only(bottom: i == headerCells.length - 1 ? 0 : 10),
              child: buildRow(context, headerCells.elementAt(i),
                  data.elementAt(index), bodyCells.elementAt(i)),
            )
        ],
      ),
    );
  }

  Widget buildRow(BuildContext context, headerCell, T item, bodyCell) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            flex: 3,
            child: headerCell is String
                ? Text(
                    headerCell,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 12),
                  )
                : headerCell()),
        Flexible(flex: 4, child: buildBodyCell(context, bodyCell, item))
      ],
    );
  }

  Widget buildBodyCell(BuildContext context, bodyCell, T item) {
    final bodyCellValue = bodyCell(item);

    if (bodyCellValue is String) {
      return buildCellText(context, bodyCellValue);
    }

    return bodyCellValue;
  }

  Widget buildCellText(BuildContext context, String text) {
    return Text(text,
        textAlign: TextAlign.right,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14));
  }
}
