part of '../basket_screen.dart';

class _TotalPaymentAndOrderBtn extends StatelessWidget {
  const _TotalPaymentAndOrderBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          thickness: 0.5.h,
          height: 0.h,
          color: ColorUtils.divider,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            bottom: 24.h,
            top: 16.h,
          ),
          child: Consumer<IBasketViewModel>(
            builder: (_, vm, __) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                vm.isBasketNotEmpty
                    ? _MoneyRow(
                        money: vm.totalPrice,
                        title: Strings.totalPayment.tr,
                        moneyStyle: TextStyleUtils.largeHeading.copyWith(
                          color: ColorUtils.primaryRedColor,
                        ),
                        titleStyle: TextStyleUtils.body,
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: 16.h),
                CustomButton(
                  onPressed: vm.isBasketNotEmpty
                      ? () {
                          Get.toNamed(
                            MyRouter.orderInfoStep1,
                            arguments: PurchaseMethod.onlineShopping,
                          );
                        }
                      : null,
                  child: Text(
                    Strings.placeOrder.tr,
                    style: TextStyleUtils.button,
                  ),
                  height: 44.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
