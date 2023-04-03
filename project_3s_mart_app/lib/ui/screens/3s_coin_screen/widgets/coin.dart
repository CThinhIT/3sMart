part of '../coin_screen.dart';

class _Coin extends StatelessWidget {
  final int coins;
  // ignore: use_key_in_widget_constructors
  const _Coin({required this.coins});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          coins.toString(),
          style: TextStyle(
            color: ColorUtils.primaryRedColor,
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 4.w),
        Container(
          margin: EdgeInsets.only(bottom: 2.h),
          child: SvgPicture.asset('assets/images/ic_3s_coin.svg',
              width: 16.r, height: 16.r),
        ),
      ],
    );
  }
}
