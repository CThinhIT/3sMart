import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/ui_models/category_ui_model.dart';

abstract class ICategoryViewModel implements ChangeNotifier {
  List<CategoryUIModel> get categories;
  List<CategoryUIModel> get subcategories;

  CategoryUIModel get selectedSubcategory;
  void selectSubcategory(CategoryUIModel subcategory);
  void selectSubcategoryById(String subcategoryId);

  CategoryUIModel get selectedCategoryTag;
  void selectCategoryTag(CategoryUIModel categoryTag);

  int get selectedIndex;
  void setSelectedIndex(
    String idSubCategory,
  );
}
