import 'package:flutter_web_app/common/models/subjects_content_count.model.dart';
import 'package:flutter_web_app/store/store.dart';

List<SubjectsContentCountModel> subjectsContentCountSelector(
    ApplicationState state) {
  return state.subjects.subjectsContentCount;
}
