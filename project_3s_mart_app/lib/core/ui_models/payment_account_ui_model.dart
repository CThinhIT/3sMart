import 'package:project_3s_mart_app/core/utils/enum.dart';

class PaymentAccountUIModel {
  String cardNo;
  String cardName;
  PaymentMethod paymentMethod;

  PaymentAccountUIModel({
    required this.cardNo,
    required this.cardName,
    required this.paymentMethod,
  });
}
