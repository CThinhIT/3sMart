import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/translation_text.dart';

import 'widgets/header_3s_mart.dart';
import 'widgets/term_and_privacy.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _duration = const Duration(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar3sMart(context),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/welcome.png',
                    fit: BoxFit.fill,
                    height: 215.h,
                    width: 343.w,
                  ),
                  SizedBox(height: 60.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: Strings.lblWelCome1.tr,
                          style: TextStyleUtils.largeHeading,
                        ),
                        TextSpan(
                          text: ' ' + Strings.appName.tr,
                          style: TextStyleUtils.largeHeading.copyWith(
                            color: ColorUtils.primaryRedColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TranslationText(
                    Strings.lblWelCome2,
                    style: TextStyleUtils.body.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorUtils.black40,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    height: 44.h,
                    onPressed: () {
                      Get.toNamed(MyRouter.userLogin);
                    },
                    btnRadius: 10,
                    btnColor: ColorUtils.primaryRedColor,
                    textColor: Colors.white,
                    child: TranslationText(
                      Strings.login,
                      style: TextStyleUtils.button.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    height: 44.h,
                    onPressed: () {
                      Get.toNamed(MyRouter.register);
                    },
                    btnRadius: 10,
                    borderColor: ColorUtils.primaryRedColor,
                    btnColor: Colors.transparent,
                    textColor: ColorUtils.primaryRedColor,
                    child: TranslationText(
                      Strings.lblNewCustomer,
                      style: TextStyleUtils.button.copyWith(
                        color: ColorUtils.primaryRedColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const TermAndPrivacy(),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
