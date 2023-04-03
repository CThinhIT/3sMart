import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iselect_purchase_method_view_model.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/common_widgets/translation_text.dart';
import 'package:provider/provider.dart';

part 'widgets/purchase_method_item.dart';

// ignore: must_be_immutable
class SelectPurchaseMethodScreen extends StatelessWidget {
  SelectPurchaseMethodScreen({Key? key}) : super(key: key);

  DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorUtils.primaryRedColor,
      statusBarBrightness: Brightness.light,
    ));
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                ColorUtils.primaryBlackColor.withOpacity(0.38),
                BlendMode.darken,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorUtils.primaryRedColor,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    SvgPicture.asset('assets/images/3SMart.svg'),
                    SizedBox(height: 26.h),
                    Image.asset(
                      'assets/images/bg_purchase.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTitle(),
                    Divider(
                      height: 1.h,
                      thickness: 1,
                      color: const Color(0xFFE2E2E2),
                    ),
                    ...buildBody(),
                    SizedBox(height: 30.h)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildTitle() {
    return Container(
      padding: EdgeInsets.all(16.r),
      alignment: Alignment.center,
      child: TranslationText(
        Strings.selectPurchaseMethod,
        style: TextStyle(
          color: Colors.black.withOpacity(0.86),
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  List<Widget> buildBody() {
    return [
      Consumer<ISelectPurchaseMethodViewModel>(
        builder: (_, vm, __) => PurchaseMethodItem(
          margin: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
          iconAsset: 'assets/images/ic_online_shopping.png',
          title: Strings.onlineShopping.tr,
          subTitle: Strings.deliveryWithin2Hours.tr,
          isEnabled: vm.isOnlineShoppingMethodEnabled,
          onPressed: () {
            Get.toNamed(
              MyRouter.selectBranchToShop,
            );
          },
        ),
      ),
      Consumer<ISelectPurchaseMethodViewModel>(
        builder: (_, vm, __) => PurchaseMethodItem(
          margin: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
          iconAsset: 'assets/images/ic_scan_and_go.png',
          title: 'Scan & Go',
          subTitle: Strings.goToSupermarketToUse.tr,
          isEnabled: vm.isScanAndGoMethodEnabled,
          onPressed: () {
            Get.toNamed(MyRouter.scanAndGoIntroduction);
          },
          isScanAndGo: true,
        ),
      ),
    ];
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: Strings.msgOutApp.tr,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorUtils.black,
        textColor: ColorUtils.white,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
