import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/button_bottom.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/widgets/progress_order_info_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanAndGoBarCodeScreen extends StatelessWidget {
  final String cartId;
  const ScanAndGoBarCodeScreen({Key? key, required this.cartId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.orderPaymentCode.tr,
          isBackEnabled: false,
        ),
      ),
      body: Column(
        children: [
          const ProgressOrderInfoWidget(
            currentOrderStep: ProgressOrderInfo.completed,
            isScanAndGoOrderProgress: true,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(23.w, 30.h, 23.w, 0),
            child: Column(
              children: [
                Text(
                  Strings.hereIsYourVoucherCode.tr,
                  style: TextStyleUtils.title.copyWith(
                    color: ColorUtils.black86,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  Strings.plsScanThisCodeAtThePriority.tr,
                  textAlign: TextAlign.center,
                  style: TextStyleUtils.subHeading.copyWith(
                    color: ColorUtils.black60,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                QrImage(
                  data: cartId,
                  version: QrVersions.auto,
                  size: 156.h,
                ),
                Text(
                  cartId,
                  style: TextStyleUtils.largeHeading.copyWith(
                    color: ColorUtils.black86,
                    letterSpacing: 16.w,
                  ),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Text(
                  Strings.thankYouAndHaveNiceDay.tr,
                  textAlign: TextAlign.center,
                  style: TextStyleUtils.subHeadingRegular.copyWith(
                    color: ColorUtils.primaryRedColor.withOpacity(0.86),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonBottom(
        onPressed: () {
          Get.offNamed(MyRouter.scan);
        },
        title: Strings.completed.tr,
      ),
    );
  }
}
