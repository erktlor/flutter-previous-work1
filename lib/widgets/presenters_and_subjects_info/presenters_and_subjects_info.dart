import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/utils/generate_path.dart';

class PresentersAndSubjectsInfo extends StatelessWidget {
  final List<PresenterModel> presenters;
  final List<SubjectModel> subjects;
  final TextStyle titleStyle;
  final TextStyle itemStyle;

  PresentersAndSubjectsInfo(
      {@required this.presenters,
      @required this.subjects,
      @required this.titleStyle,
      @required this.itemStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [buildPresenters(), buildSubjects()],
      ),
    );
  }

  Widget buildPresenters() {
    if (presenters.length == 0) {
      return const SizedBox.shrink();
    }

    return Wrap(
      children: [
        Text(
          'Presenters: ',
          style: titleStyle,
        ),
        for (final presenter in presenters)
          GestureDetector(
            onTap: () {
              final path =
                  generatePath(Routes.presenter, {'presenterId': presenter.id});
              navigatorKey.currentState.pushNamed(path);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  presenter.name +
                      (presenters.indexOf(presenter) == presenters.length - 1
                          ? ''
                          : ', '),
                  style: itemStyle,
                ),
              ),
            ),
          ),
        const SizedBox(width: 5),
      ],
    );
  }

  Widget buildSubjects() {
    if (subjects.length == 0) {
      return const SizedBox.shrink();
    }

    return Wrap(
      children: [
        Text(
          'Subjects: ',
          style: titleStyle,
        ),
        for (final subject in subjects)
          GestureDetector(
            onTap: () {
              final path =
                  generatePath(Routes.subject, {'subjectId': subject.id});
              navigatorKey.currentState.pushNamed(path);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  subject.name +
                      (subjects.indexOf(subject) == subjects.length - 1
                          ? ''
                          : ', '),
                  style: itemStyle,
                ),
              ),
            ),
          )
      ],
    );
  }
}
