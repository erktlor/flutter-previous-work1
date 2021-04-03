import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/store/header/header.actions.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout_body.dart';
import 'package:redux/redux.dart';

class PageLayout extends StatelessWidget {
  final Widget header;
  final Widget child;

  PageLayout({@required this.header, @required this.child});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, PageLayoutProps>(
        converter: PageLayoutProps.fromStore,
        distinct: true,
        builder: (context, props) {
          return Container(
            child: Column(
              children: [
                header,
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    return PageLayoutBody(
                      child: child,
                      constraints: constraints,
                      onScrollChanged: props.setScrolled,
                    );
                  }),
                )
              ],
            ),
          );
        });
  }
}

class PageLayoutProps extends Equatable {
  final Function(bool) setScrolled;

  PageLayoutProps({@required this.setScrolled});

  static PageLayoutProps fromStore(Store<ApplicationState> store) {
    return PageLayoutProps(setScrolled: (bool scrolled) {
      store.dispatch(SetHeaderScrolledAction(scrolled: scrolled));
    });
  }

  @override
  List<Object> get props => [];
}
