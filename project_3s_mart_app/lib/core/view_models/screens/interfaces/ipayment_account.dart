import 'package:flutter/cupertino.dart';
import 'package:project_3s_mart_app/core/ui_models/payment_account_ui_model.dart';

abstract class IPaymentAccountViewModel implements ChangeNotifier{
  List<PaymentAccountUIModel> get paymentAccounts;
  void addPaymentAccount(PaymentAccountUIModel creditCard);
  void deletePaymentAccount(PaymentAccountUIModel creditCard);
  PaymentAccountUIModel? paymentAccount;
}