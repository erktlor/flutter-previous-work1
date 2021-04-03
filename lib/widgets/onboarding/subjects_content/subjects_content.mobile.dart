import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:flutter_web_app/utils/contains_by_id.dart';
import 'package:flutter_web_app/widgets/onboarding/subjects_content/onboarding_subject_item.dart';
import 'package:flutter_web_app/widgets/onboarding/subjects_content/subjects_content.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectsContentMobile extends StatelessWidget {
  final List<SubjectModel> subjects;
  final List<SubjectModel> selectedSubjects;
  final Function(SubjectModel) onSubjectSelect;
  final VoidCallback onNext;

  SubjectsContentMobile(
      {@required this.subjects,
      @required this.selectedSubjects,
      @required this.onSubjectSelect,
      @required this.onNext});

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
                      'Choose your subjects',
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
                    onPressed: onNext,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'NEXT',
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
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects.elementAt(index);

        return OnboardingSubjectItem(
          subject: subject,
          onTap: selectedSubjects.length >= maxSelectedSubjects &&
                  !containsById(selectedSubjects, subject)
              ? null
              : () => onSubjectSelect(subject),
          selected: containsById(selectedSubjects, subject),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
