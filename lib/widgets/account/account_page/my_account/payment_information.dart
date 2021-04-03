import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/constants/external_links.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:flutter_web_app/widgets/account/account_page/my_account/account_action_button.dart';
import 'package:flutter_web_app/widgets/account/account_page/my_account/account_form_title.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      child: Flex(
        direction: mobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            mobile ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: mobile ? 0 : 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountFormTitle(text: 'Update your payment information'),
                Text(
                  'To update your payment information, please visit our secure payment system.',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray3),
                ),
                Text(
                  'Note: secure form will open in a new window',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue7),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
          Expanded(
            flex: mobile ? 0 : 1,
            child: AccountActionButton(
                text: 'UPDATE PAYMENT INFO',
                onTap: () {
                  openLink(ExternalLinks.creditcardUpdate);
                }),
          )
        ],
      ),
    );
  }
}
