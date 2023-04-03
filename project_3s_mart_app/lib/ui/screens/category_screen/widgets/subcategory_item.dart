part of '../category_screen.dart';

class _SubcategoryItem extends StatelessWidget {
  final CategoryUIModel subcategory;

  // ignore: use_key_in_widget_constructors
  const _SubcategoryItem({
    required this.subcategory,
  });

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      onPressed: () {
        Get.toNamed(
          MyRouter.productCategory,
          arguments: ProductFilterArguments(
            subcategoryId: subcategory.id,
          ),
        );
      },
      borderRadius: BorderRadius.circular(8.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 54.r,
            height: 54.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: ColorUtils.greyLight,
              image: DecorationImage(
                image: AssetImage(subcategory.imageUrl),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            constraints: BoxConstraints(minHeight: 32.h),
            width: 48.w,
            child: Text(
              adjustNameToDisplayCorrectly(subcategory.name),
              textAlign: TextAlign.center,
              style: TextStyleUtils.footnoteBold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Adjust category name to display correctly
  ///
  /// In some cases, name displays incorrectly
  /// Ex: When name = 'Tubers, Fruits', it displays like
  ///    |Turbers, F|  <- line1
  ///    |   uits   |  <- line2
  String adjustNameToDisplayCorrectly(String name) {
    var words = name.split(" ");

    /// Add '\n' to the end of the first word whose length >= 7
    /// to make the other words ending line
    if (words.length >= 2 && words.first.length >= 7) {
      return name.replaceFirst(' ', '\n');
    }
    return name;
  }
}
