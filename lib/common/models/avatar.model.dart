import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar.model.g.dart';

@JsonSerializable()
class AvatarModel {
  final String id;
  final String name;
  final String imageUri;

  AvatarModel(
      {@required this.id, @required this.name, @required this.imageUri});

  factory AvatarModel.fromJson(Map<String, dynamic> json) =>
      _$AvatarModelFromJson(json);
  Map<String, dynamic> toJson() => _$AvatarModelToJson(this);
}
