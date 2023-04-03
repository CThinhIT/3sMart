part of "../scan_and_go_cart_screen.dart";

class _PaymentOverview extends StatelessWidget {
  const _PaymentOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.r, 8.h, 16.w, 8.h),
      child: Consumer<IBasketViewModel>(
        builder: (_, vm, __) {
          return Column(
            children: [
              MoneyRow(
                title: Strings.provisionalInvoice.tr,
                money: vm.provisionalTotalPrice,
              ),
              SizedBox(height: 12.h),
              MoneyRow(
                title: Strings.estimatedDeliveryFee.tr,
                money: vm.estimatedDeliveryPrice,
              ),
              SizedBox(height: 12.h),
              MoneyRow(
                title: Strings.discountSubtotal.tr,
                money: -vm.discountAmount,
                titleStyle: TextStyleUtils.body.copyWith(
                  color: ColorUtils.orange86,
                ),
                moneyStyle: TextStyleUtils.body.copyWith(
                  color: ColorUtils.orange86,
                ),
              ),
              SizedBox(height: 12.h),
              MoneyRow(
                title: Strings.totalPayment.tr,
                money: vm.totalPrice,
                titleStyle: TextStyleUtils.subHeadingRegular,
                moneyStyle: TextStyleUtils.subHeadingRegular.copyWith(
                  color: ColorUtils.primaryRedColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MoneyRow extends StatelessWidget {
  final String title;
  final double money;
  final TextStyle titleStyle;
  final TextStyle moneyStyle;

  // ignore: use_key_in_widget_constructors
  MoneyRow({
    required this.title,
    required this.money,
    TextStyle? titleStyle,
    TextStyle? moneyStyle,
  })  : titleStyle = titleStyle ??
            TextStyleUtils.body.copyWith(color: ColorUtils.black60),
        moneyStyle = moneyStyle ??
            TextStyleUtils.body.copyWith(color: ColorUtils.black60);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: titleStyle),
        Text(CurrencyUtils.formatCurrency(money), style: moneyStyle),
      ],
    );
  }
}
