import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/button_bottom.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VoucherBarCodeScreen extends StatelessWidget {
  final String voucherId;
  const VoucherBarCodeScreen({Key? key, required this.voucherId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: "Voucher-$voucherId",
          isBackEnabled: false,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(30.w, 70.h, 29.w, 0),
                child: Column(
                  children: [
                    Text(
                      Strings.yourVoucherCode.tr,
                      style: TextStyleUtils.title.copyWith(
                        color: ColorUtils.black86,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      Strings.plsGiveThisCode.tr,
                      textAlign: TextAlign.center,
                      style: TextStyleUtils.subHeading.copyWith(
                        color: ColorUtils.black60,
                      ),
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                    Text(
                      "Voucher-$voucherId",
                      style: TextStyleUtils.bodyStrong.copyWith(
                        color: ColorUtils.black86,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    QrImage(
                      data: "Voucher-$voucherId",
                      version: QrVersions.auto,
                      size: 156.h,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      Strings.thankYouAndHaveNiceDay.tr,
                      textAlign: TextAlign.center,
                      style: TextStyleUtils.subHeadingRegular.copyWith(
                        color: ColorUtils.primaryRedColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonBottom(
        onPressed: () {
          Get.offNamedUntil(MyRouter.home,
              (route) => route.settings.name == MyRouter.selectPurchaseMethod);
        },
        title: Strings.completed.tr,
      ),
    );
  }
}
