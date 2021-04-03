import 'package:flutter/material.dart';
import 'package:flutter_web_app/widgets/account/account_page/account_section_separator.dart';

class UnpaidInvoices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [AccountSectionSeparator(text: 'Unpaid Invoices')],
      ),
    );
  }
}
