import 'package:flutter/cupertino.dart';
import 'package:project_3s_mart_app/core/ui_models/basket_item_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/coupon_ui_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/core/utils/list_extension.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'dart:math';

class BasketViewModel extends ChangeNotifier implements IBasketViewModel {
  final _basketItems = BasketItemUIModel.basketsDemo.toList(growable: true);
  @override
  List<BasketItemUIModel> get basketItems => _basketItems;

  @override
  double get discountAmount {
    return _basketItems.sum((item) => (item.discountAmount));
  }

  @override

  /// Tạm tính = total price without discount
  double get provisionalTotalPrice {
    return _basketItems.sum((item) => item.totalPriceAfterDiscount);
  }

  @override
  double get totalPrice {
    var totalPayment =
        provisionalTotalPrice - discountAmount + estimatedDeliveryPrice;
    return max(totalPayment, 0);
  }

  @override
  double get totalPriceAfterDiscount {
    return _basketItems.sum((item) => item.totalPriceAfterDiscount);
  }

  @override
  double get estimatedDeliveryPrice => 50000;

  @override
  bool get isBasketNotEmpty => _basketItems.isNotEmpty;

  /// Add [quantity] for the existing product in basket
  /// Remove the product from basket if quantity after added = 0
  @override
  void addQuantity(String productId, int quantity) {
    var basketItem =
        _basketItems.firstWhere((element) => element.product.id == productId);
    basketItem.quantity += quantity;
    if (basketItem.quantity == 0) {
      removeBasketItem(productId);
      return;
    }
    notifyListeners();
  }

  /// Remove product in basket by [productId]
  @override
  void removeBasketItem(String productId) {
    _basketItems.removeWhere((element) => element.product.id == productId);
    notifyListeners();
  }

  /// Add [product] to basket, quantity = 1
  @override
  void addBasketItem(ProductUIModel product, {int quantity = 1}) {
    var basketItem = BasketItemUIModel(product: product, quantity: quantity);
    _basketItems.insert(0, basketItem);
    notifyListeners();
  }

  /// Get basket product by [productId]
  @override
  BasketItemUIModel? getBasketItem(String productId) {
    return _basketItems.firstOrDefault(
      (basetProduct) => basetProduct.product.id == productId,
    );
  }

  /// Reuturn quantity of basket product with id = [productId]
  /// Return 0 if the product is not in basket
  @override
  int getBasketItemQuantity(String productId) {
    return getBasketItem(productId)?.quantity ?? 0;
  }

  int _selectWeight = 0;
  @override
  int get selectWeight => _selectWeight;
  @override
  set selectWeight(int value) {
    _selectWeight = value;
    notifyListeners();
  }


  
  @override
  int get basketQuantity => basketItems.sumInt((element) => element.quantity);

  @override
  CouponUIModel? selectedCoupon;
  @override
  void onSelectOrRemoveCouponPressed(CouponUIModel coupon) {
    selectedCoupon = (selectedCoupon == coupon) ? null : coupon;
    notifyListeners();
  }

  int _basketsCount = 0;
  @override
  int get basketsCount => _basketsCount;

  bool _isExpand = false;

  @override
  void onLoadMore() {
    _isExpand = !_isExpand;
    if (_isExpand) {
      _basketsCount = _basketItems.length;
    } else {
      _basketsCount = 2;
    }
    notifyListeners();
  }

  @override
  void init() {
    _basketsCount = _basketItems.length < 2 ? _basketItems.length : 2;
    _isExpand = false;
    notifyListeners();
  }

}
