// Get presenters

import 'package:flutter/cupertino.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';

class GetPresentersAction {}

class GetPresentersRequestAction {}

class GetPresentersSuccessAction {
  final List<PresenterModel> presenters;

  GetPresentersSuccessAction({@required this.presenters});
}

class GetPresentersFailureAction {}
