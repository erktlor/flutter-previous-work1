import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/constants/app_colors.dart';
import 'package:flutter_web_app/common/models/personal_information.model.dart';
import 'package:flutter_web_app/store/account/account.actions.dart';
import 'package:flutter_web_app/store/account/account.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/personal_information/personal_information_page/personal_information_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';

class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _PersonalInformationPageProps>(
      builder: (context, props) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle('Personal information'),
              const SizedBox(
                height: 10,
              ),
              buildSubtitle(
                  'Please use the form below to update your personal information.'),
              const SizedBox(
                height: 20,
              ),
              if (props.loading) LinearProgressIndicator(),
              if (!props.loading && props.personalInformation != null)
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 600),
                    child: PersonalInformationForm(
                        updating: props.updating,
                        onSubmit: props.onUpdate,
                        personalInformation: props.personalInformation),
                  ),
                )
            ],
          ),
        );
      },
      converter: _PersonalInformationPageProps.fromStore,
      distinct: true,
    );
  }

  Widget buildTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: 40, fontWeight: FontWeight.w700, color: AppColors.gray3),
    );
  }

  Widget buildSubtitle(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.gray3),
    );
  }
}

class _PersonalInformationPageProps extends Equatable {
  final PersonalInformationModel personalInformation;
  final bool loading;
  final bool updating;
  final Function(PersonalInformationModel) onUpdate;

  _PersonalInformationPageProps(
      {@required this.personalInformation,
      @required this.loading,
      @required this.updating,
      @required this.onUpdate});

  static _PersonalInformationPageProps fromStore(
      Store<ApplicationState> store) {
    return _PersonalInformationPageProps(
        personalInformation: personalInformationSelector(store.state),
        loading: isFetchingPersonalInformation(store.state),
        updating: isUpdatingPersonalInformation(store.state),
        onUpdate: (PersonalInformationModel personalInformation) {
          store.dispatch(UpdatePersonalInformationAction(
              personalInformation: personalInformation));
        });
  }

  @override
  List<Object> get props => [personalInformation, loading, updating];
}
