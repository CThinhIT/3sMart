import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/ui_models/category_ui_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icategory_view_model.dart';

class CategoryViewModel extends ChangeNotifier implements ICategoryViewModel {
  // TODO:
  @override
  List<CategoryUIModel> get categories => CategoryUIModel.categories;

  @override
  // TODO:
  List<CategoryUIModel> get subcategories =>
      CategoryUIModel.subcategoriesInSearchProducts;

  // TODO: remove init _selectedSubcategory
  late CategoryUIModel _selectedSubcategory =
      CategoryUIModel.subcategoriesInSearchProducts.first;
  @override
  CategoryUIModel get selectedSubcategory => _selectedSubcategory;
  @override
  void selectSubcategory(CategoryUIModel subcategory) {
    _selectedSubcategory = subcategory;
    setSelectedIndex(subcategory.id);
    selectCategoryTag(subcategory.subcategories!.first);
    notifyListeners();
  }

  // TODO: remove init _selectedCategoryTag
  late CategoryUIModel _selectedCategoryTag =
      _selectedSubcategory.subcategories!.first;
  @override
  CategoryUIModel get selectedCategoryTag => _selectedCategoryTag;
  @override
  void selectCategoryTag(CategoryUIModel categoryTag) {
    _selectedCategoryTag = categoryTag;
    notifyListeners();
  }

  @override
  void selectSubcategoryById(String subcategoryId) {
    var subcategory = CategoryUIModel.subcategoriesInSearchProducts
        .firstWhere((element) => element.id == subcategoryId);
    selectSubcategory(subcategory);
  }

  int _selectedIndex = 0;
  @override
  // TODO: implement positionSelected
  int get selectedIndex => _selectedIndex;
  @override
  void setSelectedIndex(String idSubCategory) {
    _selectedIndex =
        (subcategories.indexWhere((element) => element.id == idSubCategory));
    notifyListeners();
  }
}
