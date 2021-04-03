import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_content.model.g.dart';

@JsonSerializable()
class NotesContentModel {
  final String type;
  final String name;
  final String notes;
  final String parameters;
  final String createdAt;
  final String updatedAt;

  NotesContentModel({
    @required this.type,
    @required this.name,
    @required this.notes,
    @required this.parameters,
    @required this.createdAt,
    @required this.updatedAt,
  });

  factory NotesContentModel.fromJson(Map<String, dynamic> json) =>
      _$NotesContentModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotesContentModelToJson(this);
}
