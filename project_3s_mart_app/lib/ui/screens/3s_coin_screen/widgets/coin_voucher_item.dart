part of '../coin_screen.dart';

class _CoinVoucherItem extends StatelessWidget {
  final CoinVoucherUIModel coinVoucher;

  // ignore: use_key_in_widget_constructors
  const _CoinVoucherItem({required this.coinVoucher});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1.r),
            color: ColorUtils.grey,
            spreadRadius: 1.r,
          ),
        ],
        color: Colors.white,
      ),
      child: RippleClickEffect(
        borderRadius: BorderRadius.circular(16.r),
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              coinVoucher.voucher.imageUrl,
              height: 124.h,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 0.40.sw),
                        child: Text(
                          coinVoucher.voucher.name,
                          style: TextStyleUtils.productType,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        Strings.vouchersLeft.tr + coinVoucher.remainingVouchers.toString(),
                        style: TextStyleUtils.footnoteSemiBold.copyWith(
                            color: ColorUtils.black60,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  const Spacer(),
                  _Coin(coins: coinVoucher.coins),
                  SizedBox(width: 8.w),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(Strings.claimVouchers.tr),
                    style: ElevatedButton.styleFrom(
                      elevation: 1.r,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 12.w,
                      ),
                      textStyle: TextStyleUtils.footnoteSemiBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
