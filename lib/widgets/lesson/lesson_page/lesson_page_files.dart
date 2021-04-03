import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/file.model.dart';
import 'package:flutter_web_app/common/models/lesson.model.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonPageFiles extends StatelessWidget {
  final LessonModel lesson;

  LessonPageFiles({@required this.lesson});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return buildFile(context, lesson.files.elementAt(index));
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: lesson.files.length);
  }

  buildFile(BuildContext context, FileModel file) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Material(
        color: AppColors.white,
        child: InkWell(
          onTap: () {
            openLink(file.fileUri);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(width: 2, color: AppColors.gray3)),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    file.name,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray3),
                  ),
                ),
                Icon(Icons.chevron_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
