import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/interview.model.dart';
import 'package:flutter_web_app/widgets/interview/interview_page/interview_page.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.dart';

class InterviewContentMobile extends StatelessWidget {
  final InterviewModel interview;

  InterviewContentMobile({@required this.interview});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavigationBar(),
          Container(
            padding: const EdgeInsets.all(15),
            child: InterviewPage(
              interview: interview,
            ),
          )
        ],
      ),
    );
  }
}
