import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingSubjectItem extends StatelessWidget {
  final SubjectModel subject;
  final VoidCallback onTap;
  final bool selected;

  OnboardingSubjectItem(
      {@required this.subject, @required this.onTap, @required this.selected});

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
                  subject.name,
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
                            Icons.remove_circle,
                            color: AppColors.orange0,
                          )
                        : Icon(
                            Icons.add_circle,
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
              subject.imageUri,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
