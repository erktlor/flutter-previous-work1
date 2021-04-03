import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/avatar.model.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingAvatarItem extends StatelessWidget {
  final AvatarModel avatar;
  final VoidCallback onTap;
  final bool selected;

  OnboardingAvatarItem(
      {@required this.avatar, @required this.onTap, @required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  avatar.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Opacity(
                opacity: onTap == null ? 0.2 : 1,
                child: IconButton(
                    icon: selected
                        ? Icon(
                            Icons.check_box,
                            color: AppColors.green1,
                          )
                        : Icon(
                            Icons.check_box_outline_blank,
                            color: AppColors.green1,
                          ),
                    onPressed: onTap),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Image.network(
              avatar.imageUri,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
