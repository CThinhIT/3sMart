part of '../coin_screen.dart';

class _ViewVoucherWalletButton extends StatelessWidget {
  const _ViewVoucherWalletButton({
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
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            top: 16.h,
            bottom: 24.h,
          ),
          child: CustomButton(
            onPressed: () {
              Get.toNamed(MyRouter.voucherWallet);
            },
            child: Text(
              Strings.viewVoucherWallet.tr,
              style: TextStyleUtils.button.copyWith(
                color: ColorUtils.primaryRedColor,
              ),
            ),
            btnColor: Colors.white,
            borderColor: ColorUtils.primaryRedColor,
            height: 48.h,
          ),
        ),
      ],
    );
  }
}
