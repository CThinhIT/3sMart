import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iauth_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SettingQuickLoginScreen extends StatelessWidget {
  const SettingQuickLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: ColorUtils.primaryRedColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/quick_login.png',
              width: 343.w,
              height: 255.h,
            ),
            SizedBox(height: 30.h),
            Text(
              Strings.quickLoginSetup.tr,
              style: TextStyleUtils.largeHeading,
            ),
            SizedBox(height: 8.h),
            Text(
              Strings.quickLoginDescription.tr,
              style: TextStyleUtils.body.copyWith(
                color: ColorUtils.black60,
              ),
            ),
            SizedBox(height: 16.h),
            _SubItem(
              content: Strings.contentQuickLogin1.tr,
            ),
            _SubItem(
              content: Strings.contentQuickLogin2.tr,
            ),
            _SubItem(
              content: Strings.contentQuickLogin3.tr,
            ),
            SizedBox(height: 30.h),
            CustomButton(
              onPressed: () async {
                await Provider.of<IAuthViewModel>(context, listen: false)
                    .authenticate();
              },
              child: Text(
                Strings.quickLoginSetup.tr,
                style: TextStyleUtils.button,
              ),
              textColor: ColorUtils.primaryRedColor,
              btnColor: Colors.transparent,
              borderColor: ColorUtils.primaryRedColor,
              height: 46,
            ),
            SizedBox(height: 13.h),
            CustomButton(
              onPressed: () {
                Get.offAllNamed(MyRouter.selectPurchaseMethod);
              },
              child: Text(
                Strings.shoppingNow.tr,
                style: TextStyleUtils.button,
              ),
              textColor: Colors.white,
              height: 46,
            ),
          ],
        ),
      ),
    );
  }
}

class _SubItem extends StatelessWidget {
  const _SubItem({
    Key? key,
    required this.content,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Row(
        children: [
          Icon(
            Icons.brightness_1,
            size: 7.r,
            color: ColorUtils.primaryRedColor,
          ),
          SizedBox(width: 8.w),
          Text(
            content,
            style: TextStyleUtils.subHeading,
          ),
        ],
      ),
    );
  }
}
