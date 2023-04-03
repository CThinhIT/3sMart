part of '../product_category_screen.dart';

class _SubcategoryItem extends StatelessWidget {
  final CategoryUIModel subcategory;

  // ignore: use_key_in_widget_constructors
  const _SubcategoryItem({required this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Consumer<ICategoryViewModel>(
      builder: (_, vm, __) {
        var isSelected = subcategory.id == vm.selectedSubcategory.id;
        return RippleClickEffect(
          onPressed: () {
            onSubcategoryPressed(vm, context);
          },
          borderRadius: BorderRadius.circular(8.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44.r,
                height: 44.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: ColorUtils.grey,
                  border: Border.all(
                    width: 2.r,
                    color: isSelected
                        ? ColorUtils.primaryRedColor
                        : Colors.transparent,
                  ),
                  image: DecorationImage(
                    image: AssetImage(subcategory.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: subcategory.name.length > 8 ? 64.w : 54.w,
                child: Text(
                  subcategory.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected
                        ? ColorUtils.primaryRedColor
                        : ColorUtils.black,
                    fontSize: 12.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onSubcategoryPressed(
    ICategoryViewModel categoryVm,
    BuildContext context,
  ) {
    if (categoryVm.selectedSubcategory != subcategory) {
      categoryVm.selectSubcategory(subcategory);
      context.read<IProductViewModel>().searchProducts(
            ProductFilterArguments(subcategoryId: subcategory.id),
          );
    }
  }
}
