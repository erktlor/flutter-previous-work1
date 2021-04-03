import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/avatar.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.actions.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/onboarding/avatars_content/avatars_content.dart';
import 'package:flutter_web_app/widgets/onboarding/subjects_content/subjects_content.dart';
import 'package:redux/redux.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool subjectsSelected = false;

  onNext() {
    setState(() {
      subjectsSelected = true;
    });
  }

  onBack() {
    setState(() {
      subjectsSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _OnboardingProps>(
      onInitialBuild: (props) {
        props.getSubjects();
        props.getAvatars();
      },
      builder: (context, props) {
        return Scaffold(
          body: props.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: subjectsSelected
                      ? AvatarsContent(
                          avatars: props.avatars,
                          selectedAvatar: props.selectedAvatar,
                          onAvatarSelect: props.selectAvatar,
                          onSave: props.selectedAvatar != null
                              ? props.saveOnboardingResults
                              : null,
                          onBack: onBack,
                          loading: props.isSavingResults)
                      : SubjectsContent(
                          subjects: props.subjects,
                          selectedSubjects: props.selectedSubjects,
                          onSubjectSelect: props.selectSubject,
                          onNext:
                              props.selectedSubjects.length > 0 ? onNext : null,
                        ),
                ),
        );
      },
      converter: _OnboardingProps.fromStore,
      distinct: true,
    );
  }
}

class _OnboardingProps extends Equatable {
  final List<SubjectModel> subjects;
  final List<AvatarModel> avatars;
  final List<SubjectModel> selectedSubjects;
  final AvatarModel selectedAvatar;
  final bool loading;
  final bool isSavingResults;
  final VoidCallback getSubjects;
  final VoidCallback getAvatars;
  final Function(SubjectModel) selectSubject;
  final Function(AvatarModel) selectAvatar;
  final VoidCallback saveOnboardingResults;

  _OnboardingProps({
    @required this.subjects,
    @required this.avatars,
    @required this.selectedSubjects,
    @required this.selectedAvatar,
    @required this.loading,
    @required this.isSavingResults,
    @required this.getSubjects,
    @required this.getAvatars,
    @required this.selectSubject,
    @required this.selectAvatar,
    @required this.saveOnboardingResults,
  });

  static _OnboardingProps fromStore(Store<ApplicationState> store) {
    return _OnboardingProps(
        subjects: onboardingSubjectsSelector(store.state),
        avatars: onboardingAvatarsSelector(store.state),
        selectedSubjects: onboardingSelectedSubjectsSelector(store.state),
        selectedAvatar: onboardingSelectedAvatarSelector(store.state),
        loading: isFetchingOnboardingSubjectsSelector(store.state) ||
            isFetchingOnboardingAvatarsSelector(store.state),
        isSavingResults: isSavingOnboardingResultsSelector(store.state),
        getSubjects: () {
          store.dispatch(GetOnboardingSubjectsAction());
        },
        getAvatars: () {
          store.dispatch(GetOnboardingAvatarsAction());
        },
        selectSubject: (SubjectModel subject) {
          store.dispatch(SelectOnboardingSubjectAction(subject: subject));
        },
        selectAvatar: (AvatarModel avatar) {
          store.dispatch(SelectOnboardingAvatarAction(avatar: avatar));
        },
        saveOnboardingResults: () {
          store.dispatch(SaveOnboardingResultsAction());
        });
  }

  @override
  List<Object> get props => [
        subjects,
        avatars,
        loading,
        isSavingResults,
        selectedSubjects,
        selectedAvatar,
      ];
}
