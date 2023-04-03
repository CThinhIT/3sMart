import 'package:project_3s_mart_app/core/ui_models/order_detail_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/recipient_information.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';

class OrderUIModel {
  List<OrderDetailUIModel> ordersDetail;
  DateTime orderTime;
  String orderID;
  String saleBranch;
  OrderStatus orderStatus;
  PaymentMethod paymentMethod;
  String shippingOption;
  RecipientInformationUIModel recipientInfo;
  ShippingStatus shippingStatus;

  OrderUIModel({
    required this.ordersDetail,
    required this.orderTime,
    required this.orderID,
    required this.orderStatus,
    required this.paymentMethod,
    required this.shippingOption,
    required this.recipientInfo,
    required this.saleBranch,
    required this.shippingStatus,
  });

  static final List<OrderUIModel> listOrdersDemo = [
    OrderUIModel(
      orderID: 'NHTL7821SA320683',
      orderTime: DateTime.now(),
      ordersDetail: OrderDetailUIModel.ordersDetail,
      paymentMethod: PaymentMethod.cOD,
      orderStatus: OrderStatus.received,
      saleBranch: 'BIG C Trường Chinh',
      shippingStatus: ShippingStatus.yourOrderIsReadyToArrive,
      shippingOption:
          'Giao hàng NGAY ( Dự kiến giao hàng 18:20 Thứ 5, ngày 8/9/2021)',
      recipientInfo: RecipientInformationUIModel(
        address: '1099 Lũy Bán Bích, P Tân Sơn Nhì, Q Tân Phú',
        fullName: 'Nguyễn Hoàng Thế Lữ',
        phoneNumber: '078 2454 274',
      ),
    ),
    OrderUIModel(
      orderID: 'NHTL7821SA320683',
      orderTime: DateTime.now().subtract(Duration(hours: 2)),
      ordersDetail: OrderDetailUIModel.ordersDetail,
      paymentMethod: PaymentMethod.domesticATMCard,
      orderStatus: OrderStatus.cancelled,
      saleBranch: 'BIG C Trường Chinh',
      shippingStatus: ShippingStatus.yourOrderIsOnDelivery,
      shippingOption:
          'Giao hàng NGAY ( Dự kiến giao hàng 18:20 Thứ 5, ngày 8/9/2021)',
      recipientInfo: RecipientInformationUIModel(
        address: '1099 Lũy Bán Bích, P Tân Sơn Nhì, Q Tân Phú',
        fullName: 'Nguyễn Hoàng Thế Lữ',
        phoneNumber: '078 2454 274',
      ),
    ),
    OrderUIModel(
      orderID: 'NHTL7821SA320683',
      saleBranch: 'AEON Mall Trường Chinh',
      orderTime: DateTime.now().subtract(Duration(days: 1)),
      ordersDetail: OrderDetailUIModel.ordersDetail,
      shippingStatus: ShippingStatus.yourOrderHasBeenTaken,
      paymentMethod: PaymentMethod.cOD,
      orderStatus: OrderStatus.successfullyDeliverded,
      shippingOption:
          'Giao hàng NGAY ( Dự kiến giao hàng 18:20 Thứ 5, ngày 8/9/2021)',
      recipientInfo: RecipientInformationUIModel(
        address: '1099 Lũy Bán Bích, P Tân Sơn Nhì, Q Tân Phú',
        fullName: 'Nguyễn Hoàng Thế Lữ',
        phoneNumber: '078 2454 274',
      ),
    ),
    OrderUIModel(
      orderID: 'NHTL7821SA320683',
      saleBranch: 'Coopmark Trường Chinh',
      shippingStatus: ShippingStatus.orderSuccess,
      orderTime: DateTime.now().subtract(Duration(days: 4)),
      ordersDetail: OrderDetailUIModel.ordersDetail,
      paymentMethod: PaymentMethod.cOD,
      orderStatus: OrderStatus.successfullyPlaced,
      shippingOption:
          'Giao hàng NGAY ( Dự kiến giao hàng 18:20 Thứ 5, ngày 8/9/2021)',
      recipientInfo: RecipientInformationUIModel(
        address: '1099 Lũy Bán Bích, P Tân Sơn Nhì, Q Tân Phú',
        fullName: 'Nguyễn Hoàng Thế Lữ',
        phoneNumber: '078 2454 274',
      ),
    ),
  ];
}
