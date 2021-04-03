import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/interview.model.dart';
import 'package:flutter_web_app/widgets/interview/interview_page/interview_page.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';

class InterviewContentDesktop extends StatelessWidget {
  final InterviewModel interview;

  InterviewContentDesktop({@required this.interview});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: InterviewPage(
              interview: interview,
            ),
          )),
          NavigationBar(),
        ],
      ),
    );
  }
}
