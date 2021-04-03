import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcast_result.model.freezed.dart';
part 'podcast_result.model.g.dart';

@freezed
abstract class PodcastResultModel with _$PodcastResultModel {
  const factory PodcastResultModel({
    @required bool favourite,
    @required bool watched,
    @required String notes,
  }) = _PodcastResultModel;

  factory PodcastResultModel.fromJson(Map<String, dynamic> json) =>
      _$PodcastResultModelFromJson(json);
}
