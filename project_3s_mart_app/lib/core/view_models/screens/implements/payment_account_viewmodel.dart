import 'package:flutter/cupertino.dart';
import 'package:project_3s_mart_app/core/ui_models/payment_account_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ipayment_account.dart';

class PaymentAccountViewModel
    with ChangeNotifier
    implements IPaymentAccountViewModel {
  final List<PaymentAccountUIModel> _paymentAccounts = [
    PaymentAccountUIModel(
      cardName: 'Nguyễn Hoàng Thế Lữ',
      cardNo: '*** ** ** 274',
      paymentMethod: PaymentMethod.momoEWallet,
    ),
  ];
  @override
  List<PaymentAccountUIModel> get paymentAccounts => _paymentAccounts;

  @override
  void addPaymentAccount(PaymentAccountUIModel creditCard) {
    creditCard.cardNo = creditCard.cardNo.replaceAll(RegExp(r'.(?=.{2})'), '*');
    _paymentAccounts.add(creditCard);
    notifyListeners();
  }

  @override
  void deletePaymentAccount(PaymentAccountUIModel creditCard) {
    _paymentAccounts.remove(creditCard);
    notifyListeners();
  }

  PaymentAccountUIModel? _paymentAccount;
  @override
  set paymentAccount(PaymentAccountUIModel? paymentAccount) {
    _paymentAccount = paymentAccount;
    notifyListeners();
  }

  @override
  PaymentAccountUIModel? get paymentAccount => _paymentAccount;
}
