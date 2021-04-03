import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/section_data_video.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/smart_video_component/smart_video_component.dart';

class SectionVideo extends StatelessWidget {
  final SectionDataVideoModel data;

  SectionVideo({@required this.data});

  @override
  Widget build(BuildContext context) {
    bool mobile = isMobile(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth:
              mobile ? double.infinity : MediaQuery.of(context).size.width / 2),
      child: SmartVideoComponent(
        videoUri: data.videoUri,
      ),
    );
  }
}
