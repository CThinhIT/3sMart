import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/ui_models/delivery_address_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';

abstract class IOrderInfoViewModel implements ChangeNotifier {
  late String fullName;
  late String phoneNumber;
  late String note;
  late String address;
  late DeliveryAddressUIModel deliveryAddressSelected;

  Future<void> init();
  Future<void> commitCustomerAndAddress();
  late bool changeDeliveryTime;
  late String deliverymethodSelected;
  late PaymentMethod paymentMethod;
  late DeliveryMethod deliveryMethod;

  late DirectPaymentMethod directPaymentMethod;
  late bool tutorialState;
  void resetFormOrderInfo();
  set isValidateName(bool value);
  set isValidatePhoneNumber(bool value);
  bool get isEnableButton;
}
