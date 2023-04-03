import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/coupon_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:provider/provider.dart';

class DiscountCode extends StatelessWidget {
  const DiscountCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: RippleClickEffect(
        onPressed: () {
          Get.toNamed(MyRouter.coupon);
        },
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Selector<IBasketViewModel, CouponUIModel?>(
            selector: (_, vm) => vm.selectedCoupon,
            builder: (_, selectedCoupon, __) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Strings.discountCode2.tr, style: TextStyleUtils.title),
                    const Icon(
                      Icons.navigate_next_outlined,
                    )
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/images/voucher.svg'),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedCoupon != null
                              ? Strings.usingDiscountCode.tr
                              : Strings.youDontHaveDiscountCode.tr,
                          style: TextStyleUtils.button,
                        ),
                        ...selectedCoupon != null
                            ? [
                                SizedBox(height: 4.h),
                                Text(
                                  selectedCoupon.title,
                                  style: TextStyleUtils.footnote.copyWith(
                                      color: ColorUtils.primaryRedColor),
                                )
                              ]
                            : [],
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
