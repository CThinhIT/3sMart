part of '../order_info_step2_screen.dart';

class _SubTotal extends StatelessWidget {
  const _SubTotal({
    Key? key,
    required this.fee,
    required this.discountValue,
    required this.totalPayment,
    required this.provisionalTotalPrice,
  }) : super(key: key);

  final double fee;
  final double discountValue;
  final double totalPayment;
  final double provisionalTotalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.provisionalInvoice.tr,
                style: TextStyleUtils.subHeading.copyWith(
                  color: ColorUtils.black60,
                ),
              ),
              Text(
                CurrencyUtils.formatCurrency(provisionalTotalPrice),
                style: TextStyleUtils.body.copyWith(
                  color: ColorUtils.black86,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.deliveryFee.tr + ':',
                style: TextStyleUtils.subHeading.copyWith(
                  color: ColorUtils.black60,
                ),
              ),
              Text(
                CurrencyUtils.formatCurrency(fee),
                style: TextStyleUtils.body.copyWith(
                  color: ColorUtils.black86,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.discountSubtotal.tr,
                style: TextStyleUtils.subHeading.copyWith(
                  color: ColorUtils.black60,
                ),
              ),
              Text(
                '- ${CurrencyUtils.formatCurrency(discountValue)}',
                style: TextStyleUtils.body.copyWith(
                  color: ColorUtils.black86,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(
              thickness: 1.h,
              height: 0.h,
              color: ColorUtils.divider,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.totalPayment.tr,
                style: TextStyleUtils.title.copyWith(
                  color: ColorUtils.black86,
                ),
              ),
              Text(
                CurrencyUtils.formatCurrency(totalPayment),
                style: TextStyleUtils.subHeadingRegular.copyWith(
                  color: ColorUtils.primaryRedColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
