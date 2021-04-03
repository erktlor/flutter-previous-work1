import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/utils/generate_path.dart';
import 'package:flutter_web_app/utils/get_route_param.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorizedHeaderSearch extends StatefulWidget {
  @override
  _AuthorizedHeaderSearchState createState() => _AuthorizedHeaderSearchState();
}

class _AuthorizedHeaderSearchState extends State<AuthorizedHeaderSearch> {
  TextEditingController controller = TextEditingController();

  _getTextStyle(BuildContext context) {
    return GoogleFonts.poppins(
        fontSize: isMobile(context) ? 14 : 24, fontWeight: FontWeight.w400);
  }

  onSearchPress(String query) {
    final path = generatePath(Routes.search, {'query': query});
    navigatorKey.currentState.pushReplacementNamed(path);
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final query = getRouteParam(context, 'query');

      if (query != null) {
        controller.value = controller.value.copyWith(text: query);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = _getTextStyle(context);

    final mobile = isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;

    final width = mobile ? screenWidth * 0.9 : screenWidth / 2;

    return Container(
      width: double.infinity,
      color: AppColors.green0,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Container(
          width: width,
          child: Stack(
            children: [
              TextFormField(
                controller: controller,
                onFieldSubmitted: onSearchPress,
                textAlign: TextAlign.center,
                style: textStyle,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: mobile ? 25 : 50),
                  hintStyle: textStyle,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'What do you want to learn?',
                  hoverColor: AppColors.white,
                  fillColor: AppColors.white,
                  filled: true,
                ),
              ),
              Positioned(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      onSearchPress(controller.text);
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
                top: 0,
                right: mobile ? 5 : 10,
                bottom: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
