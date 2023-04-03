part of '../coin_screen.dart';

class _ConiRedeemingCategoryList extends StatelessWidget {
  const _ConiRedeemingCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 124.h,
      child: Consumer<ICoinViewModel>(
        builder: (_, vm, __) => ListView.separated(
          itemCount: vm.coinRedeemingCategories.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => _CoinRedeemingCategoryItem(
            category: vm.coinRedeemingCategories[index],
          ),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => SizedBox(width: 8.w),
          padding: EdgeInsets.fromLTRB(8.w, 0, 0, 0),
        ),
      ),
    );
  }
}
