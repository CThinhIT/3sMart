import 'package:flutter/cupertino.dart';
import 'package:project_3s_mart_app/core/ui_models/basket_item_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/coupon_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';

abstract class IBasketViewModel with ChangeNotifier {
  List<BasketItemUIModel> get basketItems;
  double get totalPrice;

  /// Tạm tính
  double get provisionalTotalPrice;
  double get totalPriceAfterDiscount;
  double get discountAmount;
  double get estimatedDeliveryPrice;
  bool get isBasketNotEmpty;

  void addQuantity(String productId, int quantity);
  void addBasketItem(ProductUIModel product, {int quantity = 1});
  void removeBasketItem(String productId);
  BasketItemUIModel? getBasketItem(String productId);
  int getBasketItemQuantity(String productId);

  late int selectWeight;
  int get basketQuantity;

  CouponUIModel? get selectedCoupon;
  set selectedCoupon(CouponUIModel? coupon);
  void onSelectOrRemoveCouponPressed(CouponUIModel coupon);

  int get basketsCount;
  void onLoadMore();
  void init();
}
