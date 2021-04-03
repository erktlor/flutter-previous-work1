// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presenters.types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PresentersState _$_$_PresentersStateFromJson(Map<String, dynamic> json) {
  return _$_PresentersState(
    presenters: (json['presenters'] as List)
        ?.map((e) => e == null
            ? null
            : PresenterModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_PresentersStateToJson(_$_PresentersState instance) =>
    <String, dynamic>{
      'presenters': instance.presenters,
    };
