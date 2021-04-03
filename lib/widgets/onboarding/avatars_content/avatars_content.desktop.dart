import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/avatar.model.dart';
import 'package:flutter_web_app/widgets/onboarding/avatars_content/onboarding_avatar_item.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarsContentDesktop extends StatelessWidget {
  final List<AvatarModel> avatars;
  final AvatarModel selectedAvatar;
  final Function(AvatarModel) onAvatarSelect;
  final VoidCallback onSave;
  final VoidCallback onBack;
  final bool loading;

  AvatarsContentDesktop(
      {@required this.avatars,
      @required this.selectedAvatar,
      @required this.onAvatarSelect,
      @required this.onSave,
      @required this.onBack,
      @required this.loading});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width * 0.6,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose your avatar',
                    style: GoogleFonts.poppins(fontSize: 40),
                  ),
                  const Spacer(),
                  RaisedButton(
                    color: AppColors.green0,
                    elevation: 0,
                    onPressed: onBack,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'BACK',
                        style: GoogleFonts.poppins(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                    color: AppColors.green0,
                    elevation: 0,
                    onPressed: onSave,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: loading
                          ? Center(
                              child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor:
                                        AlwaysStoppedAnimation(AppColors.black),
                                  )))
                          : Text(
                              'SAVE',
                              style: GoogleFonts.poppins(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              buildGrid()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: [
        for (final avatar in avatars)
          OnboardingAvatarItem(
            avatar: avatar,
            onTap: () => onAvatarSelect(avatar),
            selected: selectedAvatar?.id == avatar.id ?? false,
          )
      ],
    );
  }
}
