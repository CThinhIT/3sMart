import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/ui_models/delivery_address_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/string_extension.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class OrderInfoViewModel extends ChangeNotifier implements IOrderInfoViewModel {
  String _address = '';
  @override
  String get address => _address;
  @override
  set address(String value) {
    _address = value;
  }

  String _fullName = '';
  @override
  String get fullName => _fullName;
  @override
  set fullName(String value) {
    _fullName = value;
  }

  String _phoneNumber = '';
  @override
  String get phoneNumber => _phoneNumber;
  @override
  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String _note = '';
  @override
  String get note => _note;
  @override
  set note(String value) {
    _note = value;
  }

  DeliveryAddressUIModel _deliveryAddressSelected = DeliveryAddressUIModel();
  @override
  DeliveryAddressUIModel get deliveryAddressSelected =>
      _deliveryAddressSelected;
  @override
  set deliveryAddressSelected(DeliveryAddressUIModel value) {
    _deliveryAddressSelected = value;
    notifyListeners();
  }

  bool _changeDeliveryTime = false;
  @override
  bool get changeDeliveryTime => _changeDeliveryTime;

  @override
  set changeDeliveryTime(bool value) {
    _changeDeliveryTime = value;
    notifyListeners();
  }

  String _deliverymethodSelected = '';
  @override
  String get deliverymethodSelected => _deliverymethodSelected;

  @override
  set deliverymethodSelected(String value) {
    _deliverymethodSelected = value;
    notifyListeners();
  }

  PaymentMethod _paymentMethod = PaymentMethod.domesticATMCard;
  @override
  PaymentMethod get paymentMethod => _paymentMethod;
  @override
  set paymentMethod(PaymentMethod value) {
    _paymentMethod = value;
    notifyListeners();
  }

  DeliveryMethod _deliveryMethod = DeliveryMethod.homeDelivery;
  @override
  DeliveryMethod get deliveryMethod => _deliveryMethod;
  @override
  set deliveryMethod(DeliveryMethod value) {
    _deliveryMethod = value;
    notifyListeners();
  }

  //
  bool _tutorialState = true;
  @override
  bool get tutorialState => _tutorialState;
  @override
  set tutorialState(bool value) {
    _tutorialState = value;
    notifyListeners();
  }

  @override
  Future<void> init() async {
    _paymentMethod = PaymentMethod.cOD;
    _changeDeliveryTime = false;
    deliverymethodSelected = Strings.standardDelivery;
  }

  @override
  Future<void> commitCustomerAndAddress() async {
    Get.toNamed(MyRouter.orderInfoStep2);
  }

  DirectPaymentMethod _directPaymentMethod = DirectPaymentMethod.kiosPayment;
  @override
  DirectPaymentMethod get directPaymentMethod => _directPaymentMethod;

  @override
  set directPaymentMethod(DirectPaymentMethod value) {
    _directPaymentMethod = value;
    notifyListeners();
  }

  @override
  void resetFormOrderInfo() {
    _fullName = locator<GlobalData>().accountInfo.userName;
    _phoneNumber = locator<GlobalData>().accountInfo.phoneNumber;
    notifyListeners();
  }

  @override
  bool get isEnableButton =>
      _isValidateName &&
      _isValidatePhoneNumber &&
      !deliveryAddressSelected.id.isNullOrEmpty();

  bool _isValidateName = true;
  @override
  set isValidateName(bool value) {
    _isValidateName = value;
    notifyListeners();
  }

  bool _isValidatePhoneNumber = true;
  @override
  set isValidatePhoneNumber(bool value) {
    _isValidatePhoneNumber = value;
    notifyListeners();
  }
}
