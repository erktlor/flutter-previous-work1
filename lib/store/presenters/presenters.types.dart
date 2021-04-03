import 'package:flutter/foundation.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'presenters.types.freezed.dart';
part 'presenters.types.g.dart';

@freezed
abstract class PresentersState with _$PresentersState {
  const factory PresentersState({@required List<PresenterModel> presenters}) =
      _PresentersState;

  factory PresentersState.initialState() => PresentersState(presenters: []);

  factory PresentersState.fromJson(Map<String, dynamic> json) =>
      _$PresentersStateFromJson(json);
}
