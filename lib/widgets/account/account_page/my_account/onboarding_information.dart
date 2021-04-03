import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/avatar.model.dart';
import 'package:flutter_web_app/common/models/subject.model.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/store/onboarding/onboarding.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/is_mobile.dart';
import 'package:flutter_web_app/widgets/account/account_page/my_account/account_action_button.dart';
import 'package:flutter_web_app/widgets/account/account_page/my_account/account_form_title.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';

class OnboardingInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return StoreConnector<ApplicationState, _OnboardingInformationProps>(
      builder: (context, props) {
        return Container(
          child: Flex(
            direction: mobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
                mobile ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: mobile ? 0 : 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccountFormTitle(text: 'Onboarding information'),
                    if (props.loading)
                      const Center(
                        child: SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            )),
                      ),
                    if (!props.loading && props.onboardingAvatar != null)
                      Text(
                        'Your avatar: ${props.onboardingAvatar.name}',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray3),
                      ),
                    if (!props.loading && props.onboardingSubjects.isNotEmpty)
                      Text(
                        'Your subjects: ${props.onboardingSubjects.map((subject) => subject.name).join(', ')}',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray3),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              Expanded(
                flex: mobile ? 0 : 1,
                child: AccountActionButton(
                    text: 'UPDATE',
                    onTap: () {
                      navigatorKey.currentState
                          .pushReplacementNamed(Routes.onboarding);
                    }),
              )
            ],
          ),
        );
      },
      converter: _OnboardingInformationProps.fromStore,
      distinct: true,
    );
  }
}

class _OnboardingInformationProps extends Equatable {
  final List<SubjectModel> onboardingSubjects;
  final AvatarModel onboardingAvatar;
  final bool loading;

  _OnboardingInformationProps(
      {@required this.onboardingSubjects,
      @required this.onboardingAvatar,
      @required this.loading});

  static _OnboardingInformationProps fromStore(Store<ApplicationState> store) {
    return _OnboardingInformationProps(
        onboardingAvatar: onboardingSelectedAvatarSelector(store.state),
        onboardingSubjects: onboardingSelectedSubjectsSelector(store.state),
        loading: isFetchingOnboardingResultsSelector(store.state));
  }

  @override
  List<Object> get props => [onboardingAvatar, onboardingSubjects, loading];
}
