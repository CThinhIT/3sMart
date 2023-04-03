import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

part 'enum_helper.dart';

// enum DeviceStatus {
//   @JsonValue(0)
//   available,
//   @JsonValue(1)
//   stolen,
//   @JsonValue(2)
//   faulty,
//   @JsonValue(3)
//   support,
// }

enum NavigationBar {
  @JsonValue(0)
  home,
  @JsonValue(1)
  category,
  @JsonValue(2)
  voucher,
  @JsonValue(3)
  account,
}

enum NavigationScanBar {
  @JsonValue(0)
  cartScan,
  @JsonValue(1)
  scan,
  @JsonValue(2)
  accountScan,
}

enum ProgressOrderInfo {
  @JsonValue(1)
  deliveryMethod,
  @JsonValue(2)
  address,
  @JsonValue(3)
  orderConfirmation,
  @JsonValue(4)
  payment,
  @JsonValue(5)
  completed,
}

enum PaymentMethod {
  @JsonValue(1)
  visaCardOrMastercard,
  @JsonValue(2)
  domesticATMCard,
  @JsonValue(3)
  momoEWallet,
  @JsonValue(4)
  cOD,
}

enum OrderStatus {
  @JsonValue(1)
  cancelled,
  @JsonValue(2)
  received,
  @JsonValue(3)
  successfullyPlaced,
  @JsonValue(4)
  successfullyDeliverded,
}

enum ShippingStatus {
  @JsonValue(1)
  deliverySuccess,
  @JsonValue(2)
  yourOrderIsReadyToArrive,
  @JsonValue(3)
  yourOrderIsOnDelivery,
  @JsonValue(4)
  yourOrderHasBeenTaken,
  @JsonValue(5)
  orderSuccess,
}

enum DirectPaymentMethod {
  @JsonValue(1)
  kiosPayment,
  @JsonValue(2)
  counterPayment,
  @JsonValue(3)
  onlinePayment,
}
enum DeliveryMethod {
  @JsonValue(1)
  homeDelivery,
  @JsonValue(2)
  pickUpLaterAtTheCounter,
}

enum ProductUnitType {
  @JsonValue(1)
  item,
  @JsonValue(2)
  gram,
  @JsonValue(3)
  kg,
  @JsonValue(4)
  box,
  @JsonValue(5)
  bottle,
  @JsonValue(6)
  bag,
  @JsonValue(7)
  carton,
  @JsonValue(7)
  stray,
}

enum PurchaseMethod {
  @JsonValue(1)
  onlineShopping,
  @JsonValue(2)
  scanAndGo,
}
