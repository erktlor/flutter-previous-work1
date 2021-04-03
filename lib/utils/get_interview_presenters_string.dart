import 'package:flutter_web_app/common/models/interview.model.dart';

String getInterviewPresentersString(InterviewModel interview) {
  return interview.presenters.map((presenter) => presenter.name).join(', ');
}
