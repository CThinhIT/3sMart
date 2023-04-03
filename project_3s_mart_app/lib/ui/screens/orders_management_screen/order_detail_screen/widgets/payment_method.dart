part of '../order_detail_screen.dart';


class _PaymentMethod extends StatelessWidget {
  const _PaymentMethod({Key? key, required this.paymentMethodValue})
      : super(key: key);
  final PaymentMethod paymentMethodValue;

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
            Strings.paymentMethods.tr,
            style: TextStyleUtils.title.copyWith(
              color: ColorUtils.black,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            EnumHelper.getDescription(
              EnumMap.paymentMethod,
              paymentMethodValue,
            ),
            style: TextStyleUtils.body.copyWith(
              color: ColorUtils.black60,
            ),
          ),
        ],
      ),
    );
  }
}
