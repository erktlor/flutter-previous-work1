import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/search_list/viewed_filter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchListHeader extends StatelessWidget {
  final String title;
  final int totalCount;
  final String filterValue;
  final List<String> filterOptions;
  final Function(String) filterOnChange;

  SearchListHeader(
      {@required this.title,
      @required this.totalCount,
      @required this.filterValue,
      @required this.filterOptions,
      @required this.filterOnChange});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      child: Flex(
        direction: mobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: mobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: mobile ? 18 : 40,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      color: AppColors.gray3),
                ),
                Text('$totalCount Content Articles',
                    style: GoogleFonts.poppins(
                        height: 1.92,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gray12))
              ],
            ),
          ),
          mobile ? const SizedBox(height: 10) : Spacer(),
          ViewedFilter(
            value: filterValue,
            options: filterOptions,
            onChange: filterOnChange,
          )
        ],
      ),
    );
  }
}
