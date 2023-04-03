import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/ui_models/coupon_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/screens/scan_and_go_screen/scan_screen/scan_screen.dart';

import 'widgets/coupon_list.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.discountCode2.tr,
          style: TextStyleUtils.heading3.copyWith(color: ColorUtils.black),
        ),
        leading: RemoveButton(
          onPressed: Get.back,
          size: 24.r,
          color: ColorUtils.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 48.h,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: ColorUtils.greyLight2,
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: 64.h,
              ),
              height: 48.h,
              color: Colors.white,
              child: TabBar(
                indicator: const UnderlineTabIndicator(
                  borderSide:
                      BorderSide(color: ColorUtils.primaryRedColor, width: 2.0),
                ),
                labelStyle: TextStyleUtils.titleSemiBold,
                unselectedLabelStyle: TextStyleUtils.title,
                labelColor: ColorUtils.primaryRedColor,
                unselectedLabelColor:
                    ColorUtils.primaryRedColor.withOpacity(0.6),
                tabs: [
                  Tab(
                    child: Text(
                      Strings.availableCode.tr,
                    ),
                  ),
                  Tab(
                    child: Text(
                      Strings.all.tr,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                CouponList(coupons: CouponUIModel.fakeList),
                CouponList(coupons: CouponUIModel.fakeList),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
