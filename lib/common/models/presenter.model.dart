import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'presenter.model.g.dart';

@JsonSerializable()
class PresenterModel {
  final String id;
  final String name;
  final String description;
  final String photoUri;

  PresenterModel(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.photoUri});

  factory PresenterModel.fromJson(Map<String, dynamic> json) =>
      _$PresenterModelFromJson(json);
  Map<String, dynamic> toJson() => _$PresenterModelToJson(this);
}
