import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/prospector_result.model.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_web_app/common/models/prospector_settings.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/custom_checkbox/custom_checkbox.dart';
import 'package:google_fonts/google_fonts.dart';

const secondsInWeek = 604800;

class ProgressDetails extends StatefulWidget {
  final List<ProspectorResultModel> results;
  final ProspectorSettingsModel settings;
  final Function(int) onSaveSettings;

  ProgressDetails(
      {@required this.results,
      @required this.settings,
      @required this.onSaveSettings});

  @override
  _ProgressDetailsState createState() => _ProgressDetailsState();
}

class _ProgressDetailsState extends State<ProgressDetails> {
  bool showCallsDialed = true;
  bool showCallsReached = true;
  bool showAppointments = true;
  int filterWeeks = 0;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  List<ProspectorResultModel> get filteredResults =>
      widget.results.where((element) {
        if (filterWeeks == 0) {
          return true;
        }

        DateTime now = DateTime.now();
        DateTime resultDate = DateTime.parse(element.createdAt);

        return now.differenceInDays(resultDate) < filterWeeks * 7;
      }).toList();

  Map<DateTime, List<ProspectorResultModel>> get groupedFilteredResults {
    final Map<DateTime, List<ProspectorResultModel>> groupedByStartDate = Map();

    for (final result in filteredResults) {
      DateTime resultDate = DateTime.parse(result.createdAt);

      DateTime startOfWeek = resultDate.startOfWeek;

      if (!groupedByStartDate.containsKey(startOfWeek)) {
        groupedByStartDate[startOfWeek] = [];
      }

      groupedByStartDate[startOfWeek].add(result);
    }

    return groupedByStartDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildInputs(),
          const SizedBox(height: 10),
          buildHeader(context),
          const SizedBox(height: 10),
          buildFilter(),
          const SizedBox(height: 10),
          SizedBox(
            height: 400,
            child: LineChart(chartData()),
          )
        ],
      ),
    );
  }

  Widget buildInputs() {
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              if (value.isNotEmpty)
                setState(() {
                  controller.value = controller.value.copyWith(text: value);
                });
            },
            decoration: InputDecoration(
                labelText: 'Weekly Target',
                labelStyle: GoogleFonts.poppins(color: AppColors.orange0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.orange0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.orange0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppColors.orange0))),
            style: GoogleFonts.poppins(fontSize: 14, color: AppColors.orange0),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Container(),
        ),
        const SizedBox(width: 10),
        Flexible(child: Container()),
      ],
    );
  }

  Widget buildHeader(context) {
    int callsDialedNumber = 0;
    int callsReachedNumber = 0;
    int appointmentsNumber = 0;

    bool mobile = isMobile(context);

    for (final result in filteredResults) {
      callsDialedNumber += result.callsDialed;
      callsReachedNumber += result.callsReached;
      appointmentsNumber += result.appointments;
    }

    List<Widget> children = [
      Flexible(
        flex: mobile ? 0 : 1,
        child: Container(
          padding: EdgeInsets.all(8),
          color: AppColors.blue2,
          child: CustomCheckbox(
            activeCheckboxBackgroundColor: AppColors.white,
            onChange: (bool value) {
              setState(() {
                showCallsDialed = value;
              });
            },
            value: showCallsDialed,
            label: Flexible(
              child: Text('Calls Dialed ($callsDialedNumber)',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(color: AppColors.white)),
            ),
          ),
        ),
      ),
      const SizedBox(width: 10),
      Flexible(
        flex: mobile ? 0 : 1,
        child: Container(
          padding: EdgeInsets.all(8),
          color: AppColors.blue3,
          child: CustomCheckbox(
            activeCheckboxBackgroundColor: AppColors.white,
            onChange: (bool value) {
              setState(() {
                showCallsReached = value;
              });
            },
            value: showCallsReached,
            label: Flexible(
              child: Text('Calls Reached ($callsReachedNumber)',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(color: AppColors.white)),
            ),
          ),
        ),
      ),
      const SizedBox(width: 10),
      Flexible(
        flex: mobile ? 0 : 1,
        child: Container(
          padding: EdgeInsets.all(8),
          color: AppColors.blue4,
          child: CustomCheckbox(
            activeCheckboxBackgroundColor: AppColors.white,
            onChange: (bool value) {
              setState(() {
                showAppointments = value;
              });
            },
            value: showAppointments,
            label: Flexible(
              child: Text('Appointments ($appointmentsNumber)',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(color: AppColors.white)),
            ),
          ),
        ),
      )
    ];

    if (mobile) {
      return Column(
        children: children,
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: children,
    );
  }

  void onSelected(int value) {
    setState(() {
      filterWeeks = value;
    });
  }

  Widget buildFilter() {
    String title;

    if (filterWeeks == 0) {
      title = 'All time';
    } else if (filterWeeks == 4) {
      title = 'Last 4 weeks';
    } else if (filterWeeks == 12) {
      title = 'Last 12 weeks';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PopupMenuButton<int>(
          tooltip: 'Filter week',
          onSelected: onSelected,
          icon: Icon(Icons.filter_list),
          itemBuilder: (context) => [
            PopupMenuItem(child: Text('Last 4 weeks'), value: 4),
            PopupMenuItem(child: Text('Last 12 weeks'), value: 12),
            PopupMenuItem(child: Text('All Time'), value: 0),
          ],
        ),
        Text(title)
      ],
    );
  }

  LineChartData chartData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => GoogleFonts.poppins(
            color: AppColors.gray16,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          margin: 10,
          getTitles: (value) {
            DateTime date = DateTime.fromMillisecondsSinceEpoch(
                (value * secondsInWeek * 1000).toInt());

            return 'week ${date.getWeek}';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => GoogleFonts.poppins(
            color: AppColors.gray16,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          getTitles: (value) {
            if (value % 2 == 0) {
              return value.toString();
            }

            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minY: 0,
      lineBarsData: linesData(),
    );
  }

  List<LineChartBarData> linesData() {
    List<FlSpot> callsDialedData = [];
    List<FlSpot> callsReachedData = [];
    List<FlSpot> appointmentsData = [];
    List<FlSpot> weeklyTargetData = [];

    for (final startOfWeek in groupedFilteredResults.keys) {
      final weekResults = groupedFilteredResults[startOfWeek];

      int callsDialedSum = 0;
      int callsReachedSum = 0;
      int appointmentsSum = 0;

      for (final result in weekResults) {
        callsDialedSum += result.callsDialed;
        callsReachedSum += result.callsReached;
        appointmentsSum += result.appointments;
      }

      double weeks = startOfWeek.secondsSinceEpoch / secondsInWeek;

      callsDialedData.add(FlSpot(weeks.toDouble(), callsDialedSum.toDouble()));
      callsReachedData
          .add(FlSpot(weeks.toDouble(), callsReachedSum.toDouble()));
      appointmentsData
          .add(FlSpot(weeks.toDouble(), appointmentsSum.toDouble()));

      if (controller.text.isNotEmpty) {
        weeklyTargetData
            .add(FlSpot(weeks.toDouble(), double.parse(controller.text)));
      }
    }

    List<LineChartBarData> result = [];

    if (callsDialedData.isNotEmpty && showCallsDialed) {
      result.add(LineChartBarData(
        spots: callsDialedData,
        colors: [
          AppColors.blue2,
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ));
    }

    if (callsReachedData.isNotEmpty && showCallsReached) {
      result.add(LineChartBarData(
        spots: callsReachedData,
        colors: [
          AppColors.blue3,
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(show: false, colors: [
          const Color(0x00aa4cfc),
        ]),
      ));
    }

    if (appointmentsData.isNotEmpty && showAppointments) {
      result.add(LineChartBarData(
        spots: appointmentsData,
        colors: [
          AppColors.blue4,
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ));
    }

    if (weeklyTargetData.isNotEmpty) {
      result.add(LineChartBarData(
        spots: weeklyTargetData,
        isCurved: true,
        colors: [
          AppColors.orange0,
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ));
    }

    return result;
  }

  @override
  void initState() {
    initFromWidget();

    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        if (controller.text.isNotEmpty) {
          widget.onSaveSettings(int.parse(controller.text));
        } else {
          initFromWidget();
        }
      }
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProgressDetails oldWidget) {
    if (oldWidget.settings != widget.settings) {
      initFromWidget();
    }

    super.didUpdateWidget(oldWidget);
  }

  initFromWidget() {
    if (widget.settings != null &&
        widget.settings.weeklyTarget.toString() != controller.text) {
      controller.value = controller.value
          .copyWith(text: widget.settings.weeklyTarget.toString());
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }
}

class LinearResults {
  final DateTime startOfWeek;
  final int number;

  LinearResults(this.startOfWeek, this.number);
}
