import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iauth_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:provider/provider.dart';
part 'widgets/otp_form_field.dart';

class OTPScreenArguments {
  final String phoneNumber;
  OTPScreenArguments({required this.phoneNumber});
}

class OTPScreen extends StatefulWidget {
  final OTPScreenArguments arguments;
  const OTPScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _rotationAnimation;
  late IAuthViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );
    _rotationAnimation =
        Tween<double>(begin: 1, end: 0).animate(_animationController);
    _animationController.forward();
    _viewModel = context.read<IAuthViewModel>();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 48.h,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.question_circle,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.confirmPhoneNumber.tr,
              style: TextStyleUtils.largeHeading,
            ),
            SizedBox(height: 4.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: Strings.msgOTP.tr,
                    style: TextStyleUtils.subHeading2,
                  ),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: widget.arguments.phoneNumber,
                        style: TextStyleUtils.subHeading2.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 22.h),
            _OTPFormField(
              animationController: _animationController,
              rotationAnimation: _rotationAnimation,
              onCompleted: (String value) async {
                var result = await _viewModel
                    .createSession(widget.arguments.phoneNumber);
                if (result) {
                  if (await _viewModel.checkSupportFingerprint()) {
                    Get.offAllNamed(MyRouter.quickLogin);
                  } else {
                    Get.offAllNamed(MyRouter.selectPurchaseMethod);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
