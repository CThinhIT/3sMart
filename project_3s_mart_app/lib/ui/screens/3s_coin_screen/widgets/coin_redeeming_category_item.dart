part of '../coin_screen.dart';

class _CoinRedeemingCategoryItem extends StatelessWidget {
  final CoinRedeemingCategoryUIModel category;

  // ignore: use_key_in_widget_constructors
  const _CoinRedeemingCategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 56.r,
            width: 56.r,
            decoration: BoxDecoration(
              color: ColorUtils.primaryRedColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 8.w,
            ),
            child: Image.asset(
              category.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            constraints: BoxConstraints(minHeight: 32.h),
            width: 60.w,
            child: Text(
              category.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyleUtils.footnoteBold,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
