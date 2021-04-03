import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_progress.actions.g.dart';

// Get content progress
class GetContentProgressAction {
  final String contentUri;

  GetContentProgressAction({@required this.contentUri});
}

class GetContentProgressRequestAction {}

@JsonSerializable()
class GetContentProgressSuccessAction {
  final String contentUri;
  final int seconds;

  GetContentProgressSuccessAction(
      {@required this.contentUri, @required this.seconds});

  factory GetContentProgressSuccessAction.fromJson(Map<String, dynamic> json) =>
      _$GetContentProgressSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetContentProgressSuccessActionToJson(this);
}

class GetContentProgressFailureAction {}

// Update content progress
class UpdateContentProgressAction {
  final String contentUri;
  final int seconds;

  UpdateContentProgressAction(
      {@required this.contentUri, @required this.seconds});
}

class UpdateContentProgressRequestAction {}

@JsonSerializable()
class UpdateContentProgressSuccessAction {
  final String contentUri;
  final int seconds;

  UpdateContentProgressSuccessAction(
      {@required this.contentUri, @required this.seconds});

  factory UpdateContentProgressSuccessAction.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateContentProgressSuccessActionFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UpdateContentProgressSuccessActionToJson(this);
}

class UpdateContentProgressFailureAction {}
