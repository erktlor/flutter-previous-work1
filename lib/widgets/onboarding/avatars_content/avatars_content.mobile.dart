import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/avatar.model.dart';
import 'package:flutter_web_app/widgets/onboarding/avatars_content/onboarding_avatar_item.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarsContentMobile extends StatelessWidget {
  final List<AvatarModel> avatars;
  final AvatarModel selectedAvatar;
  final Function(AvatarModel) onAvatarSelect;
  final VoidCallback onSave;
  final bool loading;

  AvatarsContentMobile(
      {@required this.avatars,
      @required this.selectedAvatar,
      @required this.onAvatarSelect,
      @required this.onSave,
      @required this.loading});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Choose your avatar',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
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
                                  width: 21,
                                  height: 21,
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
              buildList()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList() {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: avatars.length,
      itemBuilder: (context, index) {
        final avatar = avatars.elementAt(index);

        return OnboardingAvatarItem(
          avatar: avatar,
          onTap: () => onAvatarSelect(avatar),
          selected: selectedAvatar?.id == avatar.id ?? false,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
