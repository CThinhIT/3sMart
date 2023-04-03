import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/ui_models/category_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iproduct_viewmodel.dart';
import 'package:project_3s_mart_app/ui/screens/product_category_screen/product_category_screen.dart';
import 'package:project_3s_mart_app/ui/utils/loading_dialog_utils.dart';

class ProductViewModel extends ChangeNotifier implements IProductViewModel {
  List<ProductUIModel>? _searchedProducts;

  @override
  List<ProductUIModel>? get searchedProducts => _searchedProducts;

  @override
  Future<void> searchProducts(ProductFilterArguments? filter) async {
    LoadingDialogUtils.showLoading();
    await Future.delayed(const Duration(seconds: 1));
    LoadingDialogUtils.hideLoading();

    /// Fake searching all products
    if (filter == null) {
      _searchedProducts = ProductUIModel.allProducts;
      notifyListeners();
      return;
    }

    /// Fake searching for products by sub-subcategory id
    if (filter.subSubcategoryId != null) {
      _searchedProducts = searchProductsBySubsubcategoryId(
        filter.subSubcategoryId!,
      );
      notifyListeners();
      return;
    }

    /// Fake searching for products by subcategory id
    if (filter.subcategoryId != null) {
      _searchedProducts = searchProductsBySubcategoryId(
        filter.subcategoryId!,
      );
      notifyListeners();
      return;
    }

    throw UnimplementedError('No faked product searching implemented');
  }

  @override
  Future<ProductUIModel> getById(String id) async {
    await Future.delayed(const Duration(seconds: 1));

    /// TODO: get product by id
    ///
    return ProductUIModel.listSelingProductsDemo.first;
  }

  @override
  void clearSearchedProducts() {
    _searchedProducts = null;
  }

  List<ProductUIModel> searchProductsBySubcategoryId(String subcategoryId) {
    var subSubcategoryIDs = CategoryUIModel.subcategoriesInSearchProducts
        .firstWhere((subcategory) => subcategory.id == subcategoryId)
        .subcategories!
        .map((subSubcategory) => subSubcategory.id)
        .toList();
    return ProductUIModel.allProducts
        .where((product) => subSubcategoryIDs.contains(product.categoryId))
        .toList();
  }

  List<ProductUIModel> searchProductsBySubsubcategoryId(
    String subSubcategoryId,
  ) {
    return ProductUIModel.allProducts
        .where((product) => product.categoryId == subSubcategoryId)
        .toList();
  }
}
