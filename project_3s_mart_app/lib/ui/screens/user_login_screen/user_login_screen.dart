import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/phone_number_text_field.dart';
import 'package:project_3s_mart_app/ui/screens/otp_screen/otp_screen.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  _UserLoginScreenState createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  late TextEditingController phoneController;
  final GlobalKey<FormState> _formKeyPhoneNumber = GlobalKey<FormState>();
  String dialCode = '+84';

  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        toolbarHeight: 48.h,
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.question_circle,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        leading: const BackButton(
          color: ColorUtils.black,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.login.tr,
              style: TextStyleUtils.largeHeading,
            ),
            SizedBox(height: 4.h),
            Text(
              Strings.msgLogin.tr,
              style: TextStyleUtils.subHeading2,
            ),
            SizedBox(height: 18.h),
            PhoneFieldWidget(
              formKeyPhoneNumber: _formKeyPhoneNumber,
              phoneController: phoneController,
              onChanged: (value) {
                dialCode = value;
              },
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.topRight,
              child: CustomButton(
                minWidth: 186.w,
                height: 43.h,
                btnColor: const Color(0xffEA2027),
                onPressed: () {
                  _onPressed();
                },
                child: Text(
                  Strings.login.tr,
                  style: TextStyleUtils.button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    if (_formKeyPhoneNumber.currentState!.validate()) {
      Get.toNamed(
        MyRouter.otp,
        arguments:
            OTPScreenArguments(phoneNumber: '$dialCode${phoneController.text}'),
      );
    }
  }
}
