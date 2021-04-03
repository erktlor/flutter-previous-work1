import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/account/account_page/my_account/my_account.dart';
import 'package:flutter_web_app/widgets/account/account_page/payment_info/payment_info.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildTitle(context, 'My Details & Invoices'),
          const SizedBox(
            height: 20,
          ),
          MyAccount(),
          const SizedBox(
            height: 20,
          ),
          buildTitle(context, 'Payment Info'),
          const SizedBox(
            height: 20,
          ),
          PaymentInfo()
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context, String text) {
    final mobile = isMobile(context);

    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: mobile ? 20 : 40,
          fontWeight: FontWeight.w700,
          color: AppColors.gray3),
    );
  }

  Widget buildButton() {
    return const SizedBox.shrink();
  }
}
