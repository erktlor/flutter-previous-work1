import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/utils/generate_path.dart';
import 'package:google_fonts/google_fonts.dart';

class PresenterItem extends StatelessWidget {
  final PresenterModel presenter;

  PresenterItem({@required this.presenter});

  void onTap() {
    final path = generatePath(Routes.presenter, {'presenterId': presenter.id});
    navigatorKey.currentState.pushReplacementNamed(path);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1)
          ]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 165,
                  child: Image(
                    image: NetworkImage(presenter.photoUri),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  presenter.name,
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.gray3),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
