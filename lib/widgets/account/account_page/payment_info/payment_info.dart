import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/models/invoice.model.dart';
import 'package:flutter_web_app/common/models/subscription.model.dart';
import 'package:flutter_web_app/store/account/account.actions.dart';
import 'package:flutter_web_app/store/account/account.selectors.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/widgets/account/account_page/payment_info/payment_history.dart';
import 'package:flutter_web_app/widgets/account/account_page/payment_info/payment_subscriptions.dart';
import 'package:redux/redux.dart';

class PaymentInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, _PaymentInfoProps>(
      builder: (context, props) {
        if (props.loading) {
          return const LinearProgressIndicator();
        }

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PaymentHistory(
                  loading: props.resending,
                  invoices: props.invoices,
                  checkedInvoices: props.checkedInvoices,
                  onSelectInvoice: props.onSelectInvoice,
                  onResendInvoice: props.onResendInvoice),
              const SizedBox(
                height: 20,
              ),
              PaymentSubscriptions(subscriptions: props.subscriptions),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
      converter: _PaymentInfoProps.fromStore,
      distinct: true,
    );
  }
}

class _PaymentInfoProps extends Equatable {
  final List<InvoiceModel> invoices;
  final List<SubscriptionModel> subscriptions;
  final bool loading;
  final bool resending;
  final Map<String, bool> checkedInvoices;
  final Function(String) onSelectInvoice;
  final VoidCallback onResendInvoice;

  _PaymentInfoProps(
      {@required this.invoices,
      @required this.subscriptions,
      @required this.loading,
      @required this.resending,
      @required this.checkedInvoices,
      @required this.onSelectInvoice,
      @required this.onResendInvoice});

  static _PaymentInfoProps fromStore(Store<ApplicationState> store) {
    return _PaymentInfoProps(
        invoices: invoicesSelector(store.state),
        subscriptions: subscriptionsSelector(store.state),
        loading: isFetchingPaymentInformation(store.state),
        resending: isResendingInvoicesSelector(store.state),
        checkedInvoices: checkedInvoicesSelector(store.state),
        onSelectInvoice: (String id) {
          store.dispatch(SelectInvoiceAction(id: id));
        },
        onResendInvoice: () {
          store.dispatch(ResendInvoiceAction());
        });
  }

  @override
  List<Object> get props =>
      [invoices, subscriptions, loading, resending, checkedInvoices];
}
