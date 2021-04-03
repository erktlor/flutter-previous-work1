import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/avatar.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/onboarding/avatars_content/avatars_content.desktop.dart';
import 'package:flutter_web_app/widgets/onboarding/avatars_content/avatars_content.mobile.dart';

const maxSelectedSubjects = 3;

class AvatarsContent extends StatelessWidget {
  final List<AvatarModel> avatars;
  final AvatarModel selectedAvatar;
  final Function(AvatarModel) onAvatarSelect;
  final VoidCallback onSave;
  final VoidCallback onBack;
  final bool loading;

  AvatarsContent(
      {@required this.avatars,
      @required this.selectedAvatar,
      @required this.onAvatarSelect,
      @required this.onSave,
      @required this.onBack,
      @required this.loading});

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? AvatarsContentMobile(
            avatars: avatars,
            selectedAvatar: selectedAvatar,
            onAvatarSelect: onAvatarSelect,
            onSave: onSave,
            loading: loading)
        : AvatarsContentDesktop(
            avatars: avatars,
            selectedAvatar: selectedAvatar,
            onAvatarSelect: onAvatarSelect,
            onSave: onSave,
            onBack: onBack,
            loading: loading);
  }
}
