import 'package:flutter/cupertino.dart';
import 'package:project_3s_mart_app/core/ui_models/category_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ihome_viewmodel.dart';

class HomeViewModel with ChangeNotifier implements IHomeViewModel {
  @override
  List<ProductUIModel> get listSelingProducts =>
      ProductUIModel.listSelingProductsDemo;

  @override
  List<ProductUIModel> get listVegetableAndFruitProducts =>
      ProductUIModel.listVegetableAndFruitDemo;

  @override
  List<CategoryUIModel> get listPopularCategories =>
      CategoryUIModel.listPopularCategoriesDemo;

  @override
  List<String> get listBanner => _listBannerDemo;

  @override
  List<String> get listPromotions => listPromotionsDemo;

  final List<String> _listBannerDemo = [
    'assets/images/banner1.png',
    'assets/images/banner1.png',
    'assets/images/banner1.png'
  ];
  final List<String> listPromotionsDemo = [
    'assets/images/promotion1.png',
    'assets/images/promotion2.png',
    'assets/images/promotion1.png'
  ];
}
