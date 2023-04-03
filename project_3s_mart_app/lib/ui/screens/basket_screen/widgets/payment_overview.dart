part of '../basket_screen.dart';

class _PaymentOverview extends StatelessWidget {
  const _PaymentOverview();

  @override
  Widget build(BuildContext context) {
    return Consumer<IBasketViewModel>(
      builder: (_, vm, __) {
        return vm.isBasketNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      children: [
                        _MoneyRow(
                          title: Strings.provisionalInvoice.tr,
                          money: vm.provisionalTotalPrice,
                        ),
                        SizedBox(height: 4.h),
                        _MoneyRow(
                          title: Strings.estimatedDeliveryFee.tr,
                          money: vm.estimatedDeliveryPrice,
                        ),
                        SizedBox(height: 4.h),
                        _MoneyRow(
                          title: Strings.discountSubtotal.tr,
                          money: -vm.discountAmount,
                          titleStyle: TextStyleUtils.body.copyWith(
                            color: ColorUtils.orange86,
                          ),
                          moneyStyle: TextStyleUtils.body.copyWith(
                            color: ColorUtils.orange86,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        _MoneyRow(
                          title: Strings.totalPayment.tr,
                          money: vm.totalPrice,
                          titleStyle: TextStyleUtils.subHeadingRegular,
                          moneyStyle: TextStyleUtils.subHeadingRegular.copyWith(
                            color: ColorUtils.primaryRedColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 4.h,
                    color: ColorUtils.divider,
                    height: 0,
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _MoneyRow extends StatelessWidget {
  final String title;
  final double money;
  final TextStyle titleStyle;
  final TextStyle moneyStyle;

  // ignore: use_key_in_widget_constructors
  _MoneyRow({
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
