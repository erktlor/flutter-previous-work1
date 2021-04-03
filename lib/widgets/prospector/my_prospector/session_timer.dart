import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:google_fonts/google_fonts.dart';

class SessionTimer extends StatelessWidget {
  final bool active;
  final String time;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onReset;
  final int callsDialed;
  final int callsReached;
  final int appointments;
  final Function(int) onCallsDialedChanged;
  final Function(int) onCallsReachedChanged;
  final Function(int) onAppointmentsChanged;
  final VoidCallback onSave;
  final bool saving;

  final List<String> headerColumnNames = ['KPI', 'Count', 'Actions'];

  SessionTimer(
      {@required this.active,
      @required this.time,
      @required this.onStart,
      @required this.onPause,
      @required this.onReset,
      @required this.callsDialed,
      @required this.callsReached,
      @required this.appointments,
      @required this.onCallsDialedChanged,
      @required this.onCallsReachedChanged,
      @required this.onAppointmentsChanged,
      @required this.onSave,
      @required this.saving});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildActions(context),
          buildTable(),
          const SizedBox(
            height: 20,
          ),
          buildSaveButton()
        ],
      ),
    );
  }

  buildActions(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: active ? onPause : onStart,
            icon: Icon(
              active ? Icons.pause : Icons.play_arrow,
              size: 40,
              color: AppColors.gray16,
            ),
          ),
          Text(
            time,
            style: GoogleFonts.poppins(
                fontSize: mobile ? 35 : 70,
                fontWeight: FontWeight.w500,
                color: AppColors.gray16),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: onReset,
            icon: Icon(
              Icons.replay,
              size: 40,
              color: AppColors.gray16,
            ),
          )
        ],
      ),
    );
  }

  buildTable() {
    return Table(
      border: TableBorder.all(color: AppColors.gray18),
      children: [
        TableRow(decoration: BoxDecoration(color: AppColors.black), children: [
          for (final name in headerColumnNames)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
              ),
            )
        ]),
        TableRow(decoration: BoxDecoration(color: AppColors.white), children: [
          buildCellText('Calls Dialed'),
          buildCellText(callsDialed.toString()),
          buildArrowsRow(
              onDown: () => onCallsDialedChanged(callsDialed - 1),
              onUp: () => onCallsDialedChanged(callsDialed + 1)),
        ]),
        TableRow(decoration: BoxDecoration(color: AppColors.white), children: [
          buildCellText('Calls Reached'),
          buildCellText(callsReached.toString()),
          buildArrowsRow(
              onDown: () => onCallsReachedChanged(callsReached - 1),
              onUp: () => onCallsReachedChanged(callsReached + 1))
        ]),
        TableRow(decoration: BoxDecoration(color: AppColors.white), children: [
          buildCellText('Appointments'),
          buildCellText(appointments.toString()),
          buildArrowsRow(
              onDown: () => onAppointmentsChanged(appointments - 1),
              onUp: () => onAppointmentsChanged(appointments + 1))
        ])
      ],
    );
  }

  Widget buildArrowsRow({VoidCallback onDown, VoidCallback onUp}) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: AppColors.gray17,
            child: Center(
              child: IconButton(
                splashRadius: double.minPositive,
                padding: EdgeInsets.zero,
                onPressed: onDown,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.white,
                  size: 35,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: AppColors.green0,
            child: Center(
              child: IconButton(
                splashRadius: double.minPositive,
                padding: EdgeInsets.zero,
                onPressed: onUp,
                icon: Icon(
                  Icons.arrow_drop_up,
                  size: 35,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildCell({Widget child}) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: AppColors.gray3)),
      child: child,
    );
  }

  Widget buildCellText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(
            fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.gray3),
      ),
    );
  }

  Widget buildSaveButton() {
    return IgnorePointer(
      ignoring: saving,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 50,
          child: FlatButton(
              color: saving ? AppColors.gray17 : AppColors.green0,
              child: const Text('Click to Save and Start a New Session'),
              onPressed: onSave),
        ),
      ),
    );
  }
}
