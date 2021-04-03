import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/interview_content_types.dart';
import 'package:flutter_web_app/common/models/search_content.model.dart';
import 'package:flutter_web_app/common/models/subjects_content_count.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/store/courses/courses.actions.dart';
import 'package:flutter_web_app/store/courses/courses.selectors.dart';
import 'package:flutter_web_app/store/interviews/interviews.actions.dart';
import 'package:flutter_web_app/store/interviews/interviews.selectors.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.actions.dart';
import 'package:flutter_web_app/store/podcasts/podcasts.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/store/subjects/subjects.actions.dart';
import 'package:flutter_web_app/store/subjects/subjects.selectors.dart';
import 'package:flutter_web_app/utils/generate_path.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.desktop.dart';
import 'package:flutter_web_app/widgets/navigation_bar/navigation_bar.mobile.dart';
import 'package:redux/redux.dart';

class NavigationBarItem {
  final String title;
  bool active;
  String route;
  List<NavigationBarItem> children;

  NavigationBarItem(
      {@required this.title,
      this.route,
      this.active = false,
      this.children = const []});
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mobile = isMobile(context);
    final routeName = ModalRoute.of(context).settings.name;

    return StoreConnector<ApplicationState, _NavigationBarItemProps>(
      onInitialBuild: (props) {
        props.getCourses();
        props.getPodcasts();
        props.getSubjectsContentCount();
        props.getKickstartVisibility();
      },
      builder: (context, props) {
        List<NavigationBarItem> navItems = [];

        navItems.add(NavigationBarItem(
            title: 'Training',
            active: routeName.contains(Routes.interviews) ||
                routeName.contains(Routes.notes),
            children: [
              NavigationBarItem(
                  title: 'All',
                  route: generatePath(
                      Routes.interviews, {'type': InterviewContentTypes.all}),
                  active:
                      routeName.contains('type=${InterviewContentTypes.all}')),
              NavigationBarItem(
                  title: 'Recent',
                  route: generatePath(Routes.interviews,
                      {'type': InterviewContentTypes.recent}),
                  active: routeName
                      .contains('type=${InterviewContentTypes.recent}')),
              if (props.kickstartVisible)
                NavigationBarItem(
                    title: 'Kickstart',
                    route: generatePath(Routes.interviews,
                        {'type': InterviewContentTypes.kickstart}),
                    active: routeName
                        .contains('type=${InterviewContentTypes.kickstart}')),
              NavigationBarItem(
                  title: 'My Subjects',
                  route: generatePath(Routes.interviews,
                      {'type': InterviewContentTypes.mySubjects}),
                  active: routeName
                      .contains('type=${InterviewContentTypes.mySubjects}')),
              NavigationBarItem(
                  title: 'Favourites',
                  route: generatePath(Routes.interviews,
                      {'type': InterviewContentTypes.favourites}),
                  active: routeName
                      .contains('type=${InterviewContentTypes.favourites}')),
              NavigationBarItem(
                  title: 'History',
                  route: generatePath(Routes.interviews,
                      {'type': InterviewContentTypes.history}),
                  active: routeName
                      .contains('type=${InterviewContentTypes.history}')),
              NavigationBarItem(
                  title: 'My Notes',
                  route: Routes.notes,
                  active: routeName.contains(Routes.notes))
            ]));

        if (props.subjectsContentCount.firstWhere(
                (element) => element.count > 0,
                orElse: () => null) !=
            null) {
          navItems.add(NavigationBarItem(
              title: 'Subjects',
              active: routeName.contains(Routes.subject),
              children: [
                for (final subjectContentCount in props.subjectsContentCount)
                  if (subjectContentCount.count > 0)
                    NavigationBarItem(
                        title:
                            '${subjectContentCount.subject.name} (${subjectContentCount.count})',
                        route: generatePath(Routes.subject,
                            {'subjectId': subjectContentCount.subject.id}),
                        active: routeName.contains(Routes.subject) &&
                            routeName.contains(subjectContentCount.subject.id)),
              ]));
        }

        navItems.add(NavigationBarItem(
            title: 'Presenters',
            route: Routes.presenters,
            active: routeName.contains(Routes.presenters)));

        if (props.searchPodcasts.isNotEmpty) {
          navItems.add(NavigationBarItem(
              title: 'Podcasts',
              active: routeName.contains(Routes.podcast),
              children: [
                for (final searchPodcast in props.searchPodcasts)
                  NavigationBarItem(
                      title: searchPodcast.name,
                      active: routeName.contains(searchPodcast.parameters),
                      route: Routes.podcast + '?' + searchPodcast.parameters),
              ]));
        }

        navItems.add(NavigationBarItem(
            title: 'Prospector',
            route: Routes.prospector,
            active: routeName.contains(Routes.prospector)));

        navItems.add(NavigationBarItem(
            title: 'Templates & Resources',
            route: Routes.resources,
            active: routeName.contains(Routes.resources)));

        if (props.searchCourses.isNotEmpty) {
          navItems.add(NavigationBarItem(
              title: 'Courses',
              active: routeName.contains(Routes.course),
              children: [
                for (final searchCourse in props.searchCourses)
                  NavigationBarItem(
                      title: searchCourse.name,
                      active: routeName.contains(searchCourse.parameters),
                      route: Routes.course + '?' + searchCourse.parameters),
              ]));
        }

        return mobile
            ? NavigationBarMobile(navItems: navItems)
            : NavigationBarDesktop(navItems: navItems);
      },
      converter: _NavigationBarItemProps.fromStore,
      distinct: true,
    );
  }
}

class _NavigationBarItemProps extends Equatable {
  final List<SearchContentModel> searchCourses;
  final List<SearchContentModel> searchPodcasts;
  final List<SubjectsContentCountModel> subjectsContentCount;
  final VoidCallback getCourses;
  final VoidCallback getPodcasts;
  final VoidCallback getSubjectsContentCount;
  final VoidCallback getKickstartVisibility;
  final bool kickstartVisible;

  _NavigationBarItemProps({
    @required this.searchCourses,
    @required this.searchPodcasts,
    @required this.subjectsContentCount,
    @required this.getCourses,
    @required this.getPodcasts,
    @required this.getSubjectsContentCount,
    @required this.getKickstartVisibility,
    @required this.kickstartVisible,
  });

  static _NavigationBarItemProps fromStore(Store<ApplicationState> store) {
    return _NavigationBarItemProps(
        searchCourses: searchCoursesSelector(store.state),
        searchPodcasts: searchPodcastsSelector(store.state),
        subjectsContentCount: subjectsContentCountSelector(store.state),
        kickstartVisible: kickstartVisibleSelector(store.state),
        getCourses: () {
          store.dispatch(SearchCoursesAction());
        },
        getPodcasts: () {
          store.dispatch(SearchPodcastsAction());
        },
        getSubjectsContentCount: () {
          store.dispatch(GetSubjectsContentCountAction());
        },
        getKickstartVisibility: () {
          store.dispatch(GetInterviewKickstartVisibilityAction());
        });
  }

  @override
  List<Object> get props =>
      [searchCourses, searchPodcasts, subjectsContentCount, kickstartVisible];
}
