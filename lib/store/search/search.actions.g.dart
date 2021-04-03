// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchContentAction _$SearchContentActionFromJson(Map<String, dynamic> json) {
  return SearchContentAction(
    query: json['query'] as String,
    presenterId: json['presenterId'] as String,
    subjectId: json['subjectId'] as String,
  );
}

Map<String, dynamic> _$SearchContentActionToJson(
        SearchContentAction instance) =>
    <String, dynamic>{
      'query': instance.query,
      'presenterId': instance.presenterId,
      'subjectId': instance.subjectId,
    };

SearchContentSuccessAction _$SearchContentSuccessActionFromJson(
    Map<String, dynamic> json) {
  return SearchContentSuccessAction(
    searchContentItems: (json['searchContentItems'] as List)
        ?.map((e) => e == null
            ? null
            : SearchContentModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchContentSuccessActionToJson(
        SearchContentSuccessAction instance) =>
    <String, dynamic>{
      'searchContentItems': instance.searchContentItems,
    };
