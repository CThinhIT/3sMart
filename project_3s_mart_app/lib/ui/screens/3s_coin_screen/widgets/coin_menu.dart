part of '../coin_screen.dart';

class _CoinMenu extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const _CoinMenu();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 8.w),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) => _CoinMenuItem(
            onPressed: () {}, menuItem: CoinMenuItemUIModel.items[index]),
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemCount: CoinMenuItemUIModel.items.length,
      ),
    );
  }
}

class _CoinMenuItem extends StatelessWidget {
  final CoinMenuItemUIModel menuItem;
  final Function() onPressed;

  const _CoinMenuItem({required this.menuItem, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(8.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorUtils.greyLight,
              image: DecorationImage(
                image: AssetImage(menuItem.imageUrl),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            constraints: BoxConstraints(minHeight: 24.h),
            width: 56.w,
            child: Text(
              menuItem.name,
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
}
