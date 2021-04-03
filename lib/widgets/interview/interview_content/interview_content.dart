import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/interview.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/interview/interview_content/interview_content.desktop.dart';
import 'package:flutter_web_app/widgets/interview/interview_content/interview_content.mobile.dart';

class InterviewContent extends StatelessWidget {
  final InterviewModel interview;

  InterviewContent({@required this.interview});

  @override
  Widget build(BuildContext context) {
    bool mobile = isMobile(context);

    return mobile
        ? InterviewContentMobile(interview: interview)
        : InterviewContentDesktop(
            interview: interview,
          );
  }
}
