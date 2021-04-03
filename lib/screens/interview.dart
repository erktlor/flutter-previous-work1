import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/interview.model.dart';
import 'package:flutter_web_app/store/interviews/interviews.actions.dart';
import 'package:flutter_web_app/store/interviews/interviews.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/interview/interview_content/interview_content.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:redux/redux.dart';

class Interview extends StatelessWidget {
  final String interviewId;

  Interview({@required this.interviewId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        onInitialBuild: (_InterviewProps props) {
          props.getInterview(interviewId);
          props.getInterviewResult(interviewId);
        },
        builder: (BuildContext context, _InterviewProps props) {
          return Scaffold(
            body: PageLayout(
              header: AuthorizedHeader(),
              child: props.interview != null
                  ? InterviewContent(interview: props.interview)
                  : const LinearProgressIndicator(),
            ),
          );
        },
        converter: _InterviewProps.fromStore,
        distinct: true);
  }
}

class _InterviewProps extends Equatable {
  final InterviewModel interview;
  final Function(String) getInterview;
  final Function(String interviewId) getInterviewResult;

  _InterviewProps(
      {@required this.interview,
      @required this.getInterview,
      @required this.getInterviewResult});

  static _InterviewProps fromStore(Store<ApplicationState> store) {
    return _InterviewProps(
        interview: interviewSelector(store.state),
        getInterview: (String interviewId) {
          store.dispatch(GetInterviewAction(interviewId: interviewId));
        },
        getInterviewResult: (String interviewId) {
          store.dispatch(GetInterviewResultAction(interviewId: interviewId));
        });
  }

  @override
  List<Object> get props => [interview];
}
