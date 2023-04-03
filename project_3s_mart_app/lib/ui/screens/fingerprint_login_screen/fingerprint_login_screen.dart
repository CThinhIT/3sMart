import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iauth_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/screens/login_screen/widgets/header_3s_mart.dart';
import 'package:project_3s_mart_app/ui/screens/login_screen/widgets/term_and_privacy.dart';
import 'package:provider/provider.dart';

class FingerprintLoginScreen extends StatefulWidget {
  const FingerprintLoginScreen({Key? key}) : super(key: key);

  @override
  State<FingerprintLoginScreen> createState() => _FingerprintLoginScreenState();
}

class _FingerprintLoginScreenState extends State<FingerprintLoginScreen> {
  late IAuthViewModel _viewModel;
  @override
  void initState() {
    _viewModel = context.read<IAuthViewModel>();
    _viewModel.authenticate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar3sMart(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/fingerprint.png'),
            const Spacer(),
            Text(
              Strings.titleQuickLogin.tr,
              style: TextStyleUtils.largeHeading.copyWith(
                color: ColorUtils.black86,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              Strings.msgQuickLogin.tr,
              style: TextStyleUtils.subHeading,
            ),
            SizedBox(height: 24.h),
            CustomButton(
              onPressed: () async {
                await _viewModel.authenticate();
              },
              height: 46.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.fastFingerprintLogin.tr,
                    style: TextStyleUtils.button,
                  ),
                  SvgPicture.asset(
                    'assets/images/fingerprint_icon.svg',
                  )
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                onPressed: () {
                  Get.toNamed(MyRouter.userLogin);
                },
                height: 30.h,
                borderColor: ColorUtils.black40,
                btnColor: ColorUtils.white,
                minWidth: 233.w,
                textColor: ColorUtils.black86,
                child: Text(
                  Strings.logInWithYourPhoneNumber.tr,
                  style: TextStyleUtils.button,
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            const TermAndPrivacy(),
          ],
        ),
      ),
    );
  }
}
