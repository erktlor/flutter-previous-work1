import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/course.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/smart_video_component/smart_video_component.dart';

class CoursePageImageAndVideo extends StatelessWidget {
  final CourseModel course;

  CoursePageImageAndVideo({@required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [buildVideo(context), buildImage(context)],
      ),
    );
  }

  Widget buildVideo(BuildContext context) {
    if (course.videoUri.isEmpty) {
      return const SizedBox.shrink();
    }

    bool mobile = isMobile(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: mobile
                ? double.infinity
                : MediaQuery.of(context).size.width * 0.8),
        child: SmartVideoComponent(
          videoUri: course.videoUri,
        ),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    if (course.featuredImageUri.isEmpty) {
      return SizedBox.shrink();
    }

    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2),
      child: Image(
        image: NetworkImage(course.featuredImageUri),
      ),
    );
  }
}
