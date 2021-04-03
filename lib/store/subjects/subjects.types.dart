import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/subjects_content_count.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subjects.types.freezed.dart';
part 'subjects.types.g.dart';

@freezed
abstract class SubjectsState with _$SubjectsState {
  const factory SubjectsState({
    @required List<SubjectsContentCountModel> subjectsContentCount,
  }) = _SubjectsState;

  factory SubjectsState.initialState() =>
      const SubjectsState(subjectsContentCount: []);

  factory SubjectsState.fromJson(Map<String, dynamic> json) =>
      _$SubjectsStateFromJson(json);
}
