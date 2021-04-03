import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/prospector_result.model.dart';
import 'package:flutter_web_app/utils/get_time_from_seconds.dart';
import 'package:flutter_web_app/widgets/custom_table/custom_table.dart';
import 'package:flutter_web_app/widgets/selected_button/selected_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dart_date/dart_date.dart';

class ResultsDataTable extends StatelessWidget {
  final List<ProspectorResultModel> results;
  final VoidCallback onGetCSVResults;

  final List<String> headerColumnNames = [
    'Date',
    'Time',
    'Calls Dialed',
    'Calls Reached',
    'Appointments'
  ];

  ResultsDataTable({@required this.results, @required this.onGetCSVResults});

  get filteredResults => results.where((element) {
        return DateTime.parse(element.createdAt)
                .differenceInDays(DateTime.now()) <
            30;
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Table shows only last 30 days'),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                height: 45,
                child: SelectedButton(
                    selected: true,
                    text: 'Download all entries to CSV',
                    onPressed: onGetCSVResults),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          buildTable()
        ],
      ),
    );
  }

  Widget buildTable() {
    return CustomTable(
      data: filteredResults,
      headerCells: headerColumnNames,
      bodyCells: [
        (result) =>
            DateTime.parse(result.createdAt).toLocal().format('dd/MM/yyyy'),
        (result) => getTimeFromSeconds(result.seconds),
        (result) => result.callsDialed.toString(),
        (result) => result.callsReached.toString(),
        (result) => result.appointments.toString(),
      ],
    );
  }

  Widget buildCellText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.gray3),
      ),
    );
  }
}
