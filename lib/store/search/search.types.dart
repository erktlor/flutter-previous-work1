import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.types.freezed.dart';
part 'search.types.g.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @required List<SearchContentModel> searchContentItems,
    @required bool searchEnabled,
  }) = _SearchState;

  factory SearchState.initialState() =>
      SearchState(searchContentItems: [], searchEnabled: false);

  factory SearchState.fromJson(Map<String, dynamic> json) =>
      _$SearchStateFromJson(json);
}
