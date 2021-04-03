import 'package:flutter/cupertino.dart';
import 'package:flutter_web_app/common/models/file.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.model.g.dart';

@JsonSerializable()
class ResourceModel {
  final String id;
  final String name;
  final List<FileModel> files;

  ResourceModel({@required this.id, @required this.name, @required this.files});

  factory ResourceModel.fromJson(Map<String, dynamic> json) =>
      _$ResourceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResourceModelToJson(this);
}
