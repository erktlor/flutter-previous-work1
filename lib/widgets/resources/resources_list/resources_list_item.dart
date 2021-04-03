import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/constants/file_types.dart';
import 'package:flutter_web_app/common/constants/images.dart';
import 'package:flutter_web_app/common/models/file.model.dart';
import 'package:flutter_web_app/common/models/resource.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/utils/open_link.dart';
import 'package:google_fonts/google_fonts.dart';

class ResourcesListItem extends StatelessWidget {
  final ResourceModel resource;
  final String search;

  ResourcesListItem({@required this.resource, @required this.search});

  List<FileModel> get filteredFiles => resource.files
      .where((file) => file.name.toLowerCase().contains(search.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildName(context),
          const SizedBox(
            height: 10,
          ),
          buildFiles()
        ],
      ),
    );
  }

  Widget buildName(BuildContext context) {
    final mobile = isMobile(context);

    return Text(
      resource.name,
      style: GoogleFonts.poppins(
          fontSize: mobile ? 20 : 29,
          fontWeight: FontWeight.w700,
          color: AppColors.gray3),
    );
  }

  Widget buildFiles() {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, int index) {
          final file = filteredFiles.elementAt(index);

          return GestureDetector(
            onTap: () => openLink(file.fileUri),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    getImage(file),
                    const SizedBox(width: 10),
                    Text(
                      file.name,
                      style: GoogleFonts.poppins(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray3),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
              height: 10,
            ),
        itemCount: filteredFiles.length);
  }

  Widget getImage(FileModel file) {
    String asset;

    switch (file.type) {
      case FileTypes.document:
        {
          asset = Images.documentImg;
          break;
        }
      case FileTypes.excel:
        {
          asset = Images.excelImg;
          break;
        }
      case FileTypes.html:
        {
          asset = Images.htmlImg;
          break;
        }
      case FileTypes.image:
        {
          asset = Images.imageImg;
          break;
        }
      case FileTypes.pdf:
        {
          asset = Images.pdfImg;
          break;
        }
    }

    if (asset != null) {
      return Image.asset(
        asset,
        width: 32,
        height: 32,
        fit: BoxFit.cover,
      );
    } else {
      return Icon(Icons.attach_file);
    }
  }
}
