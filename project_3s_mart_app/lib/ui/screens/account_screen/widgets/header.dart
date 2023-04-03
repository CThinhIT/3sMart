part of '../account_screen.dart';

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.isOnlineShopping,
  }) : super(key: key);
  final bool isOnlineShopping;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorUtils.primaryRedColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(50.r, 14.r),
              bottomRight: Radius.elliptical(50.r, 14.r),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 8.h,
                bottom: 8.h,
              ),
              child: isOnlineShopping
                  ? HomeAppBar(
                      leading: Text(
                        locator<GlobalData>().deviceInfo.userName,
                        style: TextStyleUtils.bodyStrong.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Text(
                      locator<GlobalData>().deviceInfo.userName,
                      style: TextStyleUtils.bodyStrong.copyWith(
                        color: Colors.white,
                      ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 52.h,
                  width: 160.w,
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 4,
                    child: RippleClickEffect(
                      onPressed: () {
                        Get.toNamed(MyRouter.coin);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 8.w,
                          top: 4.h,
                          bottom: 4.h,
                          right: 8.w,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/3s_point.svg',
                              width: 24.w,
                              height: 24.h,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '500',
                                  style: TextStyleUtils.bodyStrong.copyWith(
                                    color: ColorUtils.primaryRedColor,
                                  ),
                                ),
                                Text(
                                  '3SCoin',
                                  style: TextStyleUtils.body.copyWith(
                                    color: ColorUtils.black40,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.navigate_next,
                              color: ColorUtils.primaryRedColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 52.h,
                  width: 160.w,
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 4,
                    child: RippleClickEffect(
                      onPressed: () {
                        Get.toNamed(MyRouter.voucherWallet);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 8.w,
                          top: 4.h,
                          bottom: 4.h,
                          right: 8.w,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/voucher.svg',
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '8',
                                  style: TextStyleUtils.bodyStrong.copyWith(
                                    color: ColorUtils.primaryRedColor,
                                  ),
                                ),
                                Text(
                                  Strings.voucher.tr,
                                  style: TextStyleUtils.footnoteSemiBold
                                      .copyWith(
                                    color: ColorUtils.black60,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.navigate_next,
                              color: ColorUtils.primaryRedColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
