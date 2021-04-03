import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'section.model.g.dart';

@JsonSerializable()
class SectionModel {
  final String type;
  final String data;

  SectionModel({@required this.type, @required this.data});

  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SectionModelToJson(this);
}
