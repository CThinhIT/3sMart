part of '../home_screen.dart';

class _RewardPoint extends StatelessWidget {
  const _RewardPoint({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(MyRouter.coin);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.accumulateRewardPoint.tr,
                  style: TextStyleUtils.title,
                ),
                const Icon(
                  Icons.navigate_next,
                  size: 30,
                ),
              ],
            ),
          ),
          Text(
            AppTranslation.translateTemplate(
              Strings.descriptionRewardPoint.tr,
              {
                'price': '250,000',
                'currency': 'VNĐ',
                'priceDiscount': '40000',
              },
            ),
            style: TextStyleUtils.footnote,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Image.asset('assets/images/coupon.png'),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 8.h,
                      width: double.infinity,
                      color: const Color(0xFFC4C4C4),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '0/250,000',
                          style: TextStyleUtils.bodyStrong.copyWith(
                            color: ColorUtils.primaryRedColor,
                          ),
                        ),
                        RippleClickEffect(
                          onPressed: () {},
                          child: Text(
                            Strings.redeem.tr,
                            style: TextStyleUtils.bodyStrong.copyWith(
                              color:
                                  ColorUtils.primaryRedColor.withOpacity(0.38),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
