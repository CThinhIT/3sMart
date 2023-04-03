part of '../scan_and_go_introduction_screen.dart';

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FunctionItem(
            svgIconAsset: 'assets/images/ic_scan2.svg',
            title: Strings.scanProductCode.tr,
            description: Strings.scanProductBarcodeAtSupermarket.tr,
          ),
          _FunctionItem(
            svgIconAsset: 'assets/images/ic_phone.svg',
            title: Strings.payViaPhone.tr,
            description: Strings.useYourPhoneToChoosePaymentMethod.tr,
          ),
          _FunctionItem(
            svgIconAsset: 'assets/images/ic_shopping_cart.svg',
            title: Strings.prioritizedPayment.tr,
            description: Strings.scanCodeAtPriorityCheckout.tr,
          ),
          SizedBox(height: 28.h),
          CustomButton(
            child: Text(
              Strings.goShoppingNow.tr,
              style: TextStyleUtils.button.copyWith(color: ColorUtils.white),
            ),
            minWidth: 200.w,
            height: 44.h,
            onPressed: () => Get.offAndToNamed(MyRouter.scan),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: TextButton(
              onPressed: () => Get.back(),
              child: Text(
                Strings.back.tr,
                style: TextStyleUtils.button.copyWith(
                  color: ColorUtils.black60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
