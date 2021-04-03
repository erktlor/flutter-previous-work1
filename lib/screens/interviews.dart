import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/interview_content_types.dart';
import 'package:flutter_web_app/common/models/search_interview.model.dart';
import 'package:flutter_web_app/store/interviews/interviews.actions.dart';
import 'package:flutter_web_app/store/interviews/interviews.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/get_route_param.dart';
import 'package:flutter_web_app/utils/interviews_to_search_items.dart';
import 'package:flutter_web_app/widgets/header/authorized_header/authorized_header.dart';
import 'package:flutter_web_app/widgets/page_layout/page_layout.dart';
import 'package:flutter_web_app/widgets/search/search_content/search_content.dart';
import 'package:redux/redux.dart';

class Interviews extends StatelessWidget {
  final String type;

  Interviews({@required this.type});

  String getTitle(BuildContext context) {
    String text;

    String type = getRouteParam(context, 'type');

    if (type == InterviewContentTypes.all) {
      text = 'All Content';
    } else if (type == InterviewContentTypes.favourites) {
      text = 'Favourite content';
    } else if (type == InterviewContentTypes.recent) {
      text = 'Recent content';
    } else if (type == InterviewContentTypes.history) {
      text = 'History';
    } else if (type == InterviewContentTypes.mySubjects) {
      text = 'My Subjects';
    } else if (type == InterviewContentTypes.kickstart) {
      text = 'Kickstart';
    } else {
      text = 'UNKNOWN';
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        onInitialBuild: (_InterviewsProps props) {
          props.getAllInterviews(type);
        },
        builder: (BuildContext context, _InterviewsProps props) {
          return Scaffold(
            body: PageLayout(
              header: AuthorizedHeader(),
              child: SearchContent(
                title: getTitle(context),
                searchContentItems: interviewsToSearchItems(props.interviews),
                loading: props.isFetchingInterviews,
              ),
            ),
          );
        },
        converter: _InterviewsProps.fromStore,
        distinct: true);
  }
}

class _InterviewsProps extends Equatable {
  final List<SearchInterviewModel> interviews;
  final bool isFetchingInterviews;
  final Function(String type) getAllInterviews;

  _InterviewsProps(
      {@required this.interviews,
      @required this.isFetchingInterviews,
      @required this.getAllInterviews});

  static _InterviewsProps fromStore(Store<ApplicationState> store) {
    return _InterviewsProps(
        interviews: interviewsSelector(store.state),
        isFetchingInterviews: isFetchingInterviewsSelector(store.state),
        getAllInterviews: (String type) {
          store.dispatch(GetInterviewsAction(type: type));
        });
  }

  @override
  List<Object> get props => [interviews, isFetchingInterviews];
}
