part of '../category_screen.dart';

class _CategoryItem extends StatelessWidget {
  final bool isSelected;
  final CategoryUIModel category;
  final Function() onPressed;

  // ignore: use_key_in_widget_constructors
  const _CategoryItem({
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      onPressed: onPressed,
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4.w,
              color: isSelected
                  ? ColorUtils.primaryRedColor
                  : ColorUtils.greyLight,
            ),
            Expanded(
              child: Container(
                color: isSelected ? Colors.white : ColorUtils.greyLight,
                padding: EdgeInsets.all(16.r),
                child: Text(
                  category.name,
                  style: TextStyle(
                    color: isSelected
                        ? ColorUtils.primaryRedColor
                        : ColorUtils.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
