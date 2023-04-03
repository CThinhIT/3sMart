import 'package:project_3s_mart_app/translation/app_translation.dart';

import 'product_ui_model.dart';

class BasketItemUIModel {
  final ProductUIModel product;
  int quantity;

  BasketItemUIModel({
    required this.product,
    required this.quantity,
  });

  double get totalPriceAfterDiscount => product.unitPriceAfterDiscount * quantity;
  double get totalPrice => product.unitPrice * quantity;
  double get discountAmount => totalPrice - totalPriceAfterDiscount;

  static final basketsDemo = ProductUIModel.listVegetableAndFruitDemo
      .sublist(0, 3)
      .map((e) => BasketItemUIModel(product: e, quantity: 1))
      .toList();
}
