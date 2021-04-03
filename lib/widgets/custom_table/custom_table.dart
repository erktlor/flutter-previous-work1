import 'package:flutter/material.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/custom_table/custom_table.desktop.dart';
import 'package:flutter_web_app/widgets/custom_table/custom_table.mobile.dart';

class CustomTable<T> extends StatelessWidget {
  final List<T> data;
  final List<dynamic> headerCells;
  final List<Function> bodyCells;

  CustomTable(
      {@required this.data,
      @required this.headerCells,
      @required this.bodyCells}) {
    assert(headerCells.length == bodyCells.length);
  }

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? CustomTableMobile(
            data: data, headerCells: headerCells, bodyCells: bodyCells)
        : CustomTableDesktop(
            data: data, headerCells: headerCells, bodyCells: bodyCells);
  }
}
