part of '../order_detail_screen.dart';

class _ShippingOption extends StatelessWidget {
  const _ShippingOption({
    Key? key,
    required this.shippingOption,
  }) : super(key: key);
  final String shippingOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.shippingOption.tr,
            style: TextStyleUtils.title.copyWith(
              color: ColorUtils.black,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            shippingOption,
            style: TextStyleUtils.body.copyWith(
              color: ColorUtils.black60,
            ),
          ),
        ],
      ),
    );
  }
}
