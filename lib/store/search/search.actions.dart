import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.actions.g.dart';

class ToggleSearchEnabledAction {}

// Search
@JsonSerializable()
class SearchContentAction {
  final String query;
  final String presenterId;
  final String subjectId;

  SearchContentAction({this.query, this.presenterId, this.subjectId});

  factory SearchContentAction.fromJson(Map<String, dynamic> json) =>
      _$SearchContentActionFromJson(json);
  Map<String, dynamic> toJson() => _$SearchContentActionToJson(this);
}

class SearchContentRequestAction {}

@JsonSerializable()
class SearchContentSuccessAction {
  final List<SearchContentModel> searchContentItems;

  SearchContentSuccessAction({@required this.searchContentItems});

  factory SearchContentSuccessAction.fromJson(Map<String, dynamic> json) =>
      _$SearchContentSuccessActionFromJson(json);
  Map<String, dynamic> toJson() => _$SearchContentSuccessActionToJson(this);
}

class SearchContentFailureAction {}
