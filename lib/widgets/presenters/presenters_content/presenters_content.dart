import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/presenters/presenters_content/presenters_content.desktop.dart';
import 'package:flutter_web_app/widgets/presenters/presenters_content/presenters_content.mobile.dart';

class PresentersContent extends StatelessWidget {
  final List<PresenterModel> presenters;
  final bool loading;

  PresentersContent({@required this.presenters, @required this.loading});

  @override
  Widget build(BuildContext context) {
    bool mobile = isMobile(context);

    return mobile
        ? PresentersContentMobile(presenters: presenters, loading: loading)
        : PresentersContentDesktop(presenters: presenters, loading: loading);
  }
}
