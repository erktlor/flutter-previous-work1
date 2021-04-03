import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file.model.g.dart';

@JsonSerializable()
class FileModel {
  final String id;
  final String name;
  final String description;
  final String type;
  final String fileUri;

  FileModel(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.type,
      @required this.fileUri});

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}
