import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/onboarding/subjects_content/subjects_content.desktop.dart';
import 'package:flutter_web_app/widgets/onboarding/subjects_content/subjects_content.mobile.dart';

const maxSelectedSubjects = 3;

class SubjectsContent extends StatelessWidget {
  final List<SubjectModel> subjects;
  final List<SubjectModel> selectedSubjects;
  final Function(SubjectModel) onSubjectSelect;
  final VoidCallback onNext;

  SubjectsContent(
      {@required this.subjects,
      @required this.selectedSubjects,
      @required this.onSubjectSelect,
      @required this.onNext});

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? SubjectsContentMobile(
            subjects: subjects,
            selectedSubjects: selectedSubjects,
            onSubjectSelect: onSubjectSelect,
            onNext: onNext,
          )
        : SubjectsContentDesktop(
            subjects: subjects,
            selectedSubjects: selectedSubjects,
            onSubjectSelect: onSubjectSelect,
            onNext: onNext,
          );
  }
}
