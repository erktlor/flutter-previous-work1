import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.model.g.dart';

@JsonSerializable()
class ResultModel {
  final String id;
  final bool watched;
  final bool favourite;
  final String notes;

  ResultModel({
    @required this.id,
    @required this.watched,
    @required this.favourite,
    @required this.notes,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}
