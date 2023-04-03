part of '../scan_and_go_order_confirm_screen.dart';

class _SubTotal extends StatelessWidget {
  const _SubTotal({
    Key? key,
    required this.discountValue,
    required this.totalPayment,
  }) : super(key: key);

  final double discountValue;
  final double totalPayment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.discountSubtotal.tr,
                style: TextStyleUtils.body.copyWith(
                  color: const Color(0xFFFF3D00).withOpacity(0.86),
                ),
              ),
              Text(
                '- ${CurrencyUtils.formatCurrency(discountValue)}',
                style: TextStyleUtils.body.copyWith(
                  color: const Color(0xFFFF3D00).withOpacity(0.86),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
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
                style: TextStyleUtils.title.copyWith(
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
