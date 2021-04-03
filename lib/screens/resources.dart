import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/resource.model.dart';
import 'package:flutter_web_app/store/resources/resources.actions.dart';
import 'package:flutter_web_app/store/resources/resources.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:flutter_web_app/widgets/resources/resources_content/resources_content.dart';
import 'package:redux/redux.dart';

class Resources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _ResourcesProps>(
      onInitialBuild: (props) {
        props.getResources();
      },
      builder: (context, props) {
        return Scaffold(
          body: PageLayout(
            header: AuthorizedHeader(),
            child: ResourcesContent(
                resources: props.resources, loading: props.isFetchingResources),
          ),
        );
      },
      converter: _ResourcesProps.fromStore,
      distinct: true,
    );
  }
}

class _ResourcesProps extends Equatable {
  final List<ResourceModel> resources;
  final bool isFetchingResources;
  final Function getResources;

  _ResourcesProps(
      {@required this.resources,
      @required this.isFetchingResources,
      @required this.getResources});

  static _ResourcesProps fromStore(Store<ApplicationState> store) {
    return _ResourcesProps(
        resources: resourcesSelector(store.state),
        isFetchingResources: isFetchingResourcesSelector(store.state),
        getResources: () {
          store.dispatch(GetResourcesAction());
        });
  }

  @override
  List<Object> get props => [resources, isFetchingResources];
}
