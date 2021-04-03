import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/downloads_file.model.dart';
import 'package:flutter_web_app/common/models/section_data_downloads.model.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionDownloads extends StatelessWidget {
  final SectionDataDownloadsModel data;

  SectionDownloads({@required this.data});

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
            height: 20,
          ),
          for (DownloadsFileModel file in data.files)
            Container(
                margin: EdgeInsets.only(bottom: 10), child: buildFile(file))
        ],
      ),
    );
  }

  void onFileTap(DownloadsFileModel file) {
    if (file.link != null) {
      openLink(file.link);
    } else if (file.fileUri != null) {
      openLink(file.fileUri);
    }
  }

  Widget buildFile(DownloadsFileModel file) {
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
                  child: Text(file.title,
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
