import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/invoice.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/account/account_page/account_section_separator.dart';
import 'package:flutter_web_app/widgets/custom_table/custom_table.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dart_date/dart_date.dart';

class PaymentHistory extends StatefulWidget {
  final List<InvoiceModel> invoices;
  final Map<String, bool> checkedInvoices;
  final Function(String) onSelectInvoice;
  final VoidCallback onResendInvoice;
  final bool loading;

  PaymentHistory(
      {@required this.invoices,
      @required this.checkedInvoices,
      @required this.onSelectInvoice,
      @required this.onResendInvoice,
      @required this.loading});

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  final List<String> headerColumnNames = ['Date', 'Total', 'Check to resend'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AccountSectionSeparator(text: 'Payment History'),
          widget.invoices.length == 0
              ? Text(
                  'No Invoices',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray3),
                )
              : buildTable(context)
        ],
      ),
    );
  }

  Widget buildTable(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        buildSendInvoiceButton(context),
        const SizedBox(
          height: 10,
        ),
        CustomTable(
          data: widget.invoices,
          headerCells: headerColumnNames,
          bodyCells: [
            (invoice) => DateTime.fromMillisecondsSinceEpoch(
                    int.parse(invoice.date) * 1000)
                .format('dd/MM/yyyy'),
            (invoice) => '\$' + invoice.total,
            (invoice) => Checkbox(
                value: widget.checkedInvoices.containsKey(invoice.id),
                onChanged: (_) {
                  widget.onSelectInvoice(invoice.id);
                })
          ],
        )
      ],
    );
  }

  Widget buildCellText(BuildContext context, String text) {
    final mobile = isMobile(context);

    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: GoogleFonts.poppins(fontSize: mobile ? 10 : 14),
        ),
      ),
    );
  }

  Widget buildCheckbox(BuildContext context, InvoiceModel invoice) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Checkbox(
          value: widget.checkedInvoices.containsKey(invoice.id),
          onChanged: (_) {
            widget.onSelectInvoice(invoice.id);
          }),
    );
  }

  Widget buildSendInvoiceButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (widget.loading)
          Container(
              margin: const EdgeInsets.only(right: 5),
              child: const SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ))),
        TextButton(
            onPressed: widget.onResendInvoice,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Resend Invoice' +
                    (widget.checkedInvoices.length > 0
                        ? ' (${widget.checkedInvoices.length})'
                        : ''),
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            )),
      ],
    );
  }
}
