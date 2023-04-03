import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';

class GiftEmptyState extends StatelessWidget {
  const GiftEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(45.w, 74.h, 45.w, 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/gift_empty.png"),
            SizedBox(
              height: 31.h,
            ),
            Text(
              Strings.youDontHaveAnyGifts.tr,
              style: TextStyleUtils.bodyStrong.copyWith(
                color: ColorUtils.primaryBlackColor,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              Strings.seeListAndChooseGift.tr,
              textAlign: TextAlign.center,
              style: TextStyleUtils.subHeading2.copyWith(
                color: ColorUtils.black60,
              ),
            ),
            SizedBox(
              height: 52.h,
            ),
            CustomButton(
              onPressed: () {
                print("morePromotions");
              },
              minWidth: 200.w,
              child: Text(
                Strings.morePromotions.tr,
                style: TextStyleUtils.button.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
