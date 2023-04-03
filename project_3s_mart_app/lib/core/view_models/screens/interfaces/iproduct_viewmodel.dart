import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/ui/screens/product_category_screen/product_category_screen.dart';

abstract class IProductViewModel implements ChangeNotifier {
  List<ProductUIModel>? get searchedProducts;

  Future<ProductUIModel> getById(String id);

  Future<void> searchProducts(ProductFilterArguments? filter);
  void clearSearchedProducts();
}
