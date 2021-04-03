import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/file.model.dart';
import 'package:flutter_web_app/common/models/topic.model.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicPageDownloads extends StatelessWidget {
  final TopicModel topic;

  TopicPageDownloads({@required this.topic});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Downloads',
            style: GoogleFonts.poppins(
                fontSize: 29,
                fontWeight: FontWeight.w700,
                color: AppColors.gray3),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return buildFile(topic.files.elementAt(index));
            },
            itemCount: topic.files.length,
            separatorBuilder: (_, __) => const SizedBox(
              height: 10,
            ),
          )
        ],
      ),
    );
  }

  void onFileTap(FileModel file) {
    if (file.fileUri.isNotEmpty) {
      openLink(file.fileUri);
    }
  }

  Widget buildFile(FileModel file) {
    return GestureDetector(
      onTap: () => onFileTap(file),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.attach_file),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(file.name,
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 34),
              child: Text(
                file.description,
                style: GoogleFonts.poppins(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
