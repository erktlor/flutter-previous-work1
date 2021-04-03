import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/presenter.model.dart';
import 'package:flutter_web_app/store/presenters/presenters.actions.dart';
import 'package:flutter_web_app/store/presenters/presenters.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:flutter_web_app/widgets/presenters/presenters_content/presenters_content.dart';
import 'package:redux/redux.dart';

class Presenters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _PresentersProps>(
        onInitialBuild: (props) {
          props.getPresenters();
        },
        builder: (context, props) {
          return Scaffold(
            body: PageLayout(
              header: AuthorizedHeader(),
              child: PresentersContent(
                  presenters: props.presenters,
                  loading: props.isFetchingPresenters),
            ),
          );
        },
        converter: _PresentersProps.fromStore,
        distinct: true);
  }
}

class _PresentersProps extends Equatable {
  final List<PresenterModel> presenters;
  final bool isFetchingPresenters;
  final Function getPresenters;

  _PresentersProps(
      {@required this.presenters,
      @required this.isFetchingPresenters,
      @required this.getPresenters});

  static _PresentersProps fromStore(Store<ApplicationState> store) {
    return _PresentersProps(
        presenters: presentersSelector(store.state),
        isFetchingPresenters: isFetchingPresentersSelector(store.state),
        getPresenters: () {
          store.dispatch(GetPresentersAction());
        });
  }

  @override
  List<Object> get props => [presenters, isFetchingPresenters];
}
