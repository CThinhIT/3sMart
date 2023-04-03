import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(Strings.inviteFriends.tr),
        toolbarHeight: 48.h,
        titleTextStyle: TextStyleUtils.heading3.copyWith(
          color: ColorUtils.black,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: const BackButton(
          color: ColorUtils.black,
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              Strings.instructions.tr,
              style: TextStyleUtils.button.copyWith(
                color: const Color(0xFF022BBC),
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFFFFFF),
              const Color(0xFFFF0007).withOpacity(0.43),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Image.asset('assets/images/invite_friends.png'),
            Positioned.fill(
              top: 50.h,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  padding: EdgeInsets.all(16.r),
                  margin: EdgeInsets.all(16.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Strings.inviteFriendTitle.tr,
                        style: TextStyleUtils.body.copyWith(
                          color: ColorUtils.black86,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.h),
                      SvgPicture.asset('assets/images/QR_code.svg'),
                      SizedBox(height: 24.h),
                      CustomButton(
                        onPressed: () {},
                        child: Text(
                          Strings.shareNow.tr,
                          style: TextStyleUtils.button,
                        ),
                        height: 44.h,
                      ),
                      SizedBox(height: 16.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: Strings.haveCode.tr,
                              style: TextStyleUtils.body,
                            ),
                            TextSpan(
                              text: Strings.selectHere.tr,
                              style: TextStyleUtils.body.copyWith(
                                color: ColorUtils.primaryRedColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //TODO
                                },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
