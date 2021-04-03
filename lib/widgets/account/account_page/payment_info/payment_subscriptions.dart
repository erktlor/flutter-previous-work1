import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/subscription.model.dart';
import 'package:flutter_web_app/widgets/account/account_page/account_section_separator.dart';
import 'package:flutter_web_app/widgets/custom_table/custom_table.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dart_date/dart_date.dart';

class PaymentSubscriptions extends StatelessWidget {
  final List<String> headerColumnNames = [
    'Product Name',
    'Next Payment Amount',
    'Next Payment Date',
    'Signup Date'
  ];
  final List<SubscriptionModel> subscriptions;

  PaymentSubscriptions({@required this.subscriptions});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AccountSectionSeparator(text: 'Subscriptions'),
          subscriptions.length == 0
              ? Text(
                  'No Subscriptions And Payment Plans',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray3),
                )
              : CustomTable(
                  data: subscriptions,
                  headerCells: headerColumnNames,
                  bodyCells: [
                    (subscription) => subscription.name,
                    (subscription) => '\$' + subscription.nextPaymentAmount,
                    (subscription) => DateTime.fromMillisecondsSinceEpoch(
                            int.parse(subscription.nextPaymentDate) * 1000)
                        .format('dd/MM/yyyy'),
                    (subscription) => DateTime.fromMillisecondsSinceEpoch(
                            int.parse(subscription.signupDate) * 1000)
                        .format('dd/MM/yyyy'),
                  ],
                )
        ],
      ),
    );
  }
}
