part of '../product_category_screen.dart';

class _CategoryTagItem extends StatelessWidget {
  final CategoryUIModel category;

  // ignore: use_key_in_widget_constructors
  const _CategoryTagItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      child: Consumer<ICategoryViewModel>(
        builder: (_, vm, __) {
          var isSelected = vm.selectedCategoryTag.id == category.id;
          return RippleClickEffect(
            onPressed: () {
              onCategoryTagPressed(vm, context);
            },
            color: isSelected ? Colors.transparent : ColorUtils.grey,
            borderRadius: BorderRadius.circular(24.r),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: isSelected
                      ? ColorUtils.primaryRedColor
                      : Colors.transparent,
                ),
              ),
              child: Text(
                category.name,
                style: TextStyleUtils.button.copyWith(
                  color: isSelected
                      ? ColorUtils.primaryRedColor
                      : ColorUtils.black60,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onCategoryTagPressed(
    ICategoryViewModel categoryVm,
    BuildContext context,
  ) {
    if (categoryVm.selectedCategoryTag.id == category.id) return;

    categoryVm.selectCategoryTag(category);
    var filter = ProductFilterArguments();
    if (category.id == CategoryUIModel.all.id) {
      /// Set filter by subcategoryId that means filter by all sub-subcategories
      /// of the selected subcategory
      filter.subcategoryId = categoryVm.selectedSubcategory.id;
    } else {
      /// Set filter by respective sub-subcategoryId 
      filter.subSubcategoryId = category.id;
    }
    context.read<IProductViewModel>().searchProducts(filter);
  }
}
