import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/interview.model.dart';
import 'package:flutter_web_app/common/models/interview_result.model.dart';
import 'package:flutter_web_app/store/interviews/interviews.actions.dart';
import 'package:flutter_web_app/store/interviews/interviews.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/custom_checkbox/custom_checkbox.dart';
import 'package:flutter_web_app/widgets/interview/interview_page/interview_page_sections/interview_page_sections.dart';
import 'package:flutter_web_app/widgets/interview/interview_page/interview_page_video.dart';
import 'package:flutter_web_app/widgets/save_text_block/save_text_block.dart';
import 'package:redux/redux.dart';

class InterviewPage extends StatelessWidget {
  final InterviewModel interview;

  InterviewPage({@required this.interview});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _InterviewPageProps>(
      builder: (context, props) {
        final favourite = props.interviewResult?.favourite ?? false;
        final watched = props.interviewResult?.watched ?? false;
        final notes = props.interviewResult?.notes ?? '';

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterviewPageVideo(
                interview: interview,
                favourite: favourite,
                onFavouriteTap: () => props.updateInterviewResult(interview.id,
                    props.interviewResult.copyWith(favourite: !favourite)),
              ),
              InterviewPageSections(interview: interview),
              const SizedBox(height: 20),
              CustomCheckbox(
                  value: watched,
                  onChange: (bool value) => props.updateInterviewResult(
                      interview.id,
                      props.interviewResult.copyWith(watched: value)),
                  label: watched
                      ? 'Content viewed.'
                      : 'Tick this box if you have read/watched this content'),
              const SizedBox(height: 20),
              SaveTextBlock(
                  saving: props.updatingInterviewResult,
                  value: notes,
                  onSave: (String value) => props.updateInterviewResult(
                      interview.id,
                      props.interviewResult.copyWith(notes: value)),
                  title: 'Notes',
                  placeholder: 'Write your notes here')
            ],
          ),
        );
      },
      converter: _InterviewPageProps.fromStore,
      distinct: true,
    );
  }
}

class _InterviewPageProps extends Equatable {
  final Function(String, InterviewResultModel) updateInterviewResult;
  final InterviewResultModel interviewResult;
  final bool updatingInterviewResult;

  _InterviewPageProps(
      {@required this.updateInterviewResult,
      @required this.interviewResult,
      @required this.updatingInterviewResult});

  static _InterviewPageProps fromStore(Store<ApplicationState> store) {
    return _InterviewPageProps(
        interviewResult: interviewResultSelector(store.state),
        updateInterviewResult:
            (String interviewId, InterviewResultModel interviewResult) {
          store.dispatch(UpdateInterviewResultAction(
              interviewId: interviewId, interviewResult: interviewResult));
        },
        updatingInterviewResult:
            isUpdatingInterviewResultSelector(store.state));
  }

  @override
  List<Object> get props => [interviewResult, updatingInterviewResult];
}
