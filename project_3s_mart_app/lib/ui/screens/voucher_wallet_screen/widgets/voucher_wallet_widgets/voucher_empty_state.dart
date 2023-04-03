import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class VoucherEmptyState extends StatelessWidget {
  const VoucherEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.1.sw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/voucher_empty.png"),
          Text(
            Strings.emptyVoucherTitle.tr,
            style: TextStyleUtils.bodyStrong.copyWith(
              color: ColorUtils.primaryBlackColor,
            ),
          ),
          Text(
            Strings.emptyVoucherSub.tr,
            textAlign: TextAlign.center,
            style: TextStyleUtils.subHeading2.copyWith(
              color: ColorUtils.black60,
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.fromLTRB(50.w, 0, 50.w, 0),
              ),
            ),
            onPressed: () {},
            child: Text(
              Strings.exploreNow.tr,
              style: TextStyleUtils.button.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
