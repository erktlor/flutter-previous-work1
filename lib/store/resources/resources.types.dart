import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/resource.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resources.types.freezed.dart';
part 'resources.types.g.dart';

@freezed
abstract class ResourcesState with _$ResourcesState {
  const factory ResourcesState({@required List<ResourceModel> resources}) =
      _ResourcesState;

  factory ResourcesState.initialState() => ResourcesState(resources: []);

  factory ResourcesState.fromJson(Map<String, dynamic> json) =>
      _$ResourcesStateFromJson(json);
}
