import 'package:flutter/cupertino.dart';
import 'package:project_3s_mart_app/core/ui_models/category_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';

abstract class IHomeViewModel implements ChangeNotifier{
  List<ProductUIModel> get listSelingProducts;
  List<ProductUIModel> get listVegetableAndFruitProducts;
  List<CategoryUIModel> get listPopularCategories;
  List<String> get listPromotions;
  List<String> get listBanner;
}