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

class OrderInfoStep4 extends StatefulWidget {
  const OrderInfoStep4({Key? key}) : super(key: key);

  @override
  _OrderInfoStep4State createState() => _OrderInfoStep4State();
}

class _OrderInfoStep4State extends State<OrderInfoStep4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.completeOrder.tr,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ProgressOrderInfoWidget(
            currentOrderStep: ProgressOrderInfo.completed,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  Strings.orderSuccess.tr,
                  style: TextStyleUtils.largeHeading2.copyWith(
                    color: ColorUtils.primaryRedColor,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  Strings.yourOrderID.tr,
                  style: TextStyleUtils.body.copyWith(
                    color: ColorUtils.subTileButtonColor,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'NHTL7821SA320683',
                  style: TextStyleUtils.largeHeading.copyWith(
                    color: ColorUtils.primaryRedColor,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  Strings.orderDescription.tr,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyleUtils.footnote.copyWith(
                    color: ColorUtils.subTileButtonColor,
                  ),
                ),
                Image.asset(
                  'assets/images/completed-order.png',
                  fit: BoxFit.cover,
                  height: 314.h,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
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
