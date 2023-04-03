part of '../exchange_coin_screen.dart';

class _ExchangeCoinBannerItem extends StatelessWidget {
  final String imageUrl;
  final Function() onImagePressed;
  final Function()? onButtonPressed;
  final String? buttonTitle;

  // ignore: use_key_in_widget_constructors
  const _ExchangeCoinBannerItem({
    required this.imageUrl,
    required this.onImagePressed,
    this.onButtonPressed,
    this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1.r),
            color: ColorUtils.grey,
            spreadRadius: 1.r,
          ),
        ],
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill),
      ),
      child: RippleClickEffect(
        borderRadius: BorderRadius.circular(16.r),
        onPressed: onImagePressed,
        child: Align(
          alignment: Alignment.bottomRight,
          child: onButtonPressed != null
              ? Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size.zero,
                      textStyle: TextStyleUtils.footnoteSemiBold,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 8.h,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      buttonTitle!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
