import 'package:flutter_web_app/common/models/interview.model.dart';

String getInterviewSubjectsString(InterviewModel interview) {
  return interview.subjects.map((subject) => subject.name).join(', ');
}
