part of '../home_screen.dart';

class _DiscountCode extends StatelessWidget {
  const _DiscountCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(MyRouter.coupon);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/tag.svg',
              width: 17.33.w,
              height: 17.33.w,
            ),
            SizedBox(width: 9.5.w),
            Expanded(
              child: Text(
                AppTranslation.translateTemplate(
                  Strings.discountCode.tr,
                  {'discounts': '60'},
                ),
                style: TextStyleUtils.footnoteBold.copyWith(
                  color: ColorUtils.primaryRedColor,
                ),
              ),
            ),
            const Icon(
              Icons.navigate_next,
              size: 30,
              color: ColorUtils.primaryRedColor,
            ),
          ],
        ),
      ),
    );
  }
}
