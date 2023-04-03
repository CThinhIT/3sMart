part of 'enum.dart';

/// Workaround to achieve enum with value (like in `C#`)
class EnumHelper {
  static int getValue<T>(Map<T, MyEnum> enumMap, T myEnum) {
    if (myEnum == null) {
      return -2;
    }

    return enumMap[myEnum]!.value;
  }

  static String getDescription<T>(Map<T, MyEnum> enumMap, T myEnum) {
    if (myEnum == null) {
      return '';
    }

    return enumMap[myEnum]!.description;
  }

  static T getEnum<T>(Map<T, MyEnum> enumMap, int value) {
    return enumMap.keys.firstWhere(
      (key) => enumMap[key]!.value == value,
      // orElse: () => null,
    );
  }

  static T getEnumFromDescription<T>(
      Map<T, MyEnum> enumMap, String description) {
    return enumMap.keys.firstWhere(
      (key) => enumMap[key]!.description == description,
      // orElse: () => null,
    );
  }
}

class MyEnum {
  late int value;
  late String description;

  MyEnum({required this.value, required this.description});
}

class EnumMap {
  static Map<NavigationBar, MyEnum> navigationBarValue = {
    NavigationBar.home: MyEnum(value: 0, description: 'Home'),
    NavigationBar.category: MyEnum(value: 1, description: 'Category'),
    NavigationBar.voucher: MyEnum(value: 2, description: 'Voucher'),
    NavigationBar.account: MyEnum(value: 3, description: 'Account'),
  };
  static Map<ProgressOrderInfo, MyEnum> progressOrderInfo = {
    ProgressOrderInfo.deliveryMethod:
        MyEnum(value: 1, description: 'Delivery method'),
    ProgressOrderInfo.address: MyEnum(value: 2, description: 'Address'),
    ProgressOrderInfo.orderConfirmation:
        MyEnum(value: 3, description: 'Order Confirmation'),
    ProgressOrderInfo.payment: MyEnum(value: 4, description: 'Payment'),
    ProgressOrderInfo.completed: MyEnum(value: 5, description: 'Completed'),
  };
  static Map<PaymentMethod, MyEnum> paymentMethod = {
    PaymentMethod.visaCardOrMastercard:
        MyEnum(value: 1, description: Strings.visaCard.tr),
    PaymentMethod.domesticATMCard:
        MyEnum(value: 2, description: Strings.domesticATMCard.tr),
    PaymentMethod.momoEWallet:
        MyEnum(value: 3, description: Strings.momoEWallet.tr),
    PaymentMethod.cOD: MyEnum(value: 4, description: Strings.cashOnDelivery.tr),
  };

  static Map<OrderStatus, MyEnum> orderStatusValue = {
    OrderStatus.cancelled: MyEnum(value: 1, description: Strings.canceled.tr),
    OrderStatus.received:
        MyEnum(value: 2, description: Strings.orderReceived.tr),
    OrderStatus.successfullyPlaced:
        MyEnum(value: 3, description: Strings.orderSuccessfullyPlaced.tr),
    OrderStatus.successfullyDeliverded:
        MyEnum(value: 4, description: Strings.successfullyDeliverded.tr),
  };

  static Map<ShippingStatus, MyEnum> shippingStatusValue = {
    ShippingStatus.deliverySuccess:
        MyEnum(value: 1, description: Strings.deliverySuccess),
    ShippingStatus.orderSuccess:
        MyEnum(value: 2, description: Strings.orderSuccess),
    ShippingStatus.yourOrderHasBeenTaken:
        MyEnum(value: 3, description: Strings.yourOrderHasBeenTaken),
    ShippingStatus.yourOrderIsOnDelivery:
        MyEnum(value: 4, description: Strings.yourOrderIsOnDelivery),
    ShippingStatus.yourOrderIsReadyToArrive:
        MyEnum(value: 4, description: Strings.yourOrderIsReadyToArrive),
  };

  static Map<DirectPaymentMethod, MyEnum> directPaymentMethod = {
    DirectPaymentMethod.kiosPayment:
        MyEnum(value: 1, description: Strings.kiosPayment.tr),
    DirectPaymentMethod.counterPayment:
        MyEnum(value: 2, description: Strings.counterPayment.tr),
    DirectPaymentMethod.onlinePayment:
        MyEnum(value: 3, description: Strings.onlinePayment.tr),
  };

  static Map<DeliveryMethod, MyEnum> deliveryMethod = {
    DeliveryMethod.homeDelivery:
        MyEnum(value: 1, description: Strings.homeDelivery.tr),
    DeliveryMethod.pickUpLaterAtTheCounter:
        MyEnum(value: 2, description: Strings.pickUpLaterAtTheCounter.tr),
  };

  static Map<NavigationScanBar, MyEnum> navigationBarScanValue = {
    NavigationScanBar.cartScan: MyEnum(value: 0, description: 'Cart Scan'),
    NavigationScanBar.scan: MyEnum(value: 1, description: 'Scan'),
    NavigationScanBar.accountScan:
        MyEnum(value: 2, description: 'Account Scan'),
  };

  static Map<ProductUnitType, MyEnum> productUnitType = {
    ProductUnitType.item: MyEnum(value: 0, description: 'Item'),
    ProductUnitType.gram: MyEnum(value: 1, description: 'Gr'),
    ProductUnitType.kg: MyEnum(value: 2, description: 'Kg'),
    ProductUnitType.box: MyEnum(value: 3, description: Strings.box.tr),
    ProductUnitType.bottle: MyEnum(value: 4, description: Strings.bottle.tr),
    ProductUnitType.bag: MyEnum(value: 5, description: Strings.bag.tr),
    ProductUnitType.carton: MyEnum(value: 6, description: Strings.carton.tr),
    ProductUnitType.stray: MyEnum(value: 7, description: Strings.stray.tr),
  };
}
