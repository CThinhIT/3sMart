part of '../account_screen.dart';

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            backgroundColor: const Color(0xFFF9F9F9),
          ),
          onPressed: () {},
          child: AccountItemWidget(
            image: 'assets/images/account_link.svg',
            color: const Color(0xFFFFF3F4),
            child: Text(
              Strings.settings.tr,
              style: TextStyleUtils.button.copyWith(
                color: ColorUtils.primaryRedColor,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            name: Strings.linkToSocialAccount.tr,
          ),
        ),
        AccountItemWidget(
          image: 'assets/images/basket.svg',
          name: Strings.myOrders.tr,
          onPressed: () {
            Get.toNamed(MyRouter.ordersManagement);
          },
        ),
        Divider(
          thickness: 0.5.h,
          color: ColorUtils.black.withOpacity(0.2),
          height: 0.h,
        ),
        AccountItemWidget(
          image: 'assets/images/transaction_setting.svg',
          name: Strings.paymentSetting.tr,
          onPressed: () {
            Get.toNamed(MyRouter.paymentSetting);
          },
        ),
        Divider(
          thickness: 0.5.h,
          color: ColorUtils.black.withOpacity(0.2),
          height: 0.h,
        ),
        AccountItemWidget(
          image: 'assets/images/address.svg',
          name: Strings.myAddresses.tr,
          onPressed: () {
            locator<GlobalData>().newAccount = AccountInfo();
            Get.toNamed(MyRouter.myAddresses);
          },
        ),
        Divider(
          thickness: 0.5.h,
          color: ColorUtils.black.withOpacity(0.2),
          height: 0.h,
        ),
        AccountItemWidget(
          image: 'assets/images/gifts.svg',
          name: Strings.gifts.tr,
          onPressed: () {
            Get.toNamed(MyRouter.accountGift);
          },
        ),
        Divider(
          thickness: 8.h,
          color: const Color(0xFFF9F9F9),
        ),
        AccountItemWidget(
          image: 'assets/images/setting.svg',
          name: Strings.setting.tr,
          onPressed: () {
            Get.toNamed(MyRouter.accountSetting);
          },
          description: Strings.fastLoginAndSecurity.tr,
        ),
        Divider(
          thickness: 8.h,
          color: const Color(0xFFF9F9F9),
        ),
        AccountItemWidget(
          image: 'assets/images/support.svg',
          name: Strings.helpCenter.tr,
          onPressed: () {},
        ),
        Divider(
          thickness: 0.5.h,
          color: ColorUtils.black.withOpacity(0.2),
          height: 0.h,
        ),
        AccountItemWidget(
          image: 'assets/images/share.svg',
          name: Strings.inviteFriends.tr,
          onPressed: () {
            Get.toNamed(MyRouter.inviteFriend);
          },
          description: Strings.getReferralGift.tr,
        ),
        Divider(
          thickness: 8.h,
          color: const Color(0xFFF9F9F9),
        ),
        SizedBox(height: 16.h),
        Text(
          'Phiên bản: 1.02.3',
          style: TextStyleUtils.footnote.copyWith(
            color: ColorUtils.black60,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
