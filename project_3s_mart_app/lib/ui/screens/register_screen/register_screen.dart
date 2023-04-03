import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/utils/validate_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_text_field_group.dart';
import 'package:project_3s_mart_app/ui/common_widgets/phone_number_text_field.dart';
import 'package:project_3s_mart_app/ui/screens/otp_screen/otp_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  final GlobalKey<FormState> _formKeyName = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPhoneNumber = GlobalKey<FormState>();
  final FocusNode _focusName = FocusNode();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPhoneNumber = FocusNode();
  String dialCode = '+84';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    _focusName.addListener(_onFocusName);
    _focusEmail.addListener(_onFocusEmail);
    _focusPhoneNumber.addListener(_onFocusPhoneNumber);
  }

  void _onFocusName() {
    if (!_focusName.hasFocus) _formKeyName.currentState?.validate();
  }

  void _onFocusEmail() {
    if (!_focusEmail.hasFocus) _formKeyEmail.currentState?.validate();
  }

  void _onFocusPhoneNumber() {
    if (!_focusPhoneNumber.hasFocus) {
      _formKeyPhoneNumber.currentState?.validate();
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    _focusName.removeListener(_onFocusName);
    _focusEmail.removeListener(_onFocusEmail);
    _focusPhoneNumber.removeListener(_onFocusPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        toolbarHeight: 48.h,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: const BackButton(
          color: ColorUtils.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.register.tr,
                style: TextStyleUtils.largeHeading,
              ),
              SizedBox(height: 4.h),
              Text(
                Strings.msgRegister.tr,
                style: TextStyleUtils.subHeading2,
              ),
              SizedBox(height: 16.h),
              _buildRegisterFromField(),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.topRight,
                child: CustomButton(
                  minWidth: 186.w,
                  height: 43.h,
                  btnColor: const Color(0xffEA2027),
                  onPressed: () async {
                    await _onPressed();
                  },
                  child: Text(
                    Strings.register.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed() async {
    if (_formKeyName.currentState!.validate() &&
        _formKeyEmail.currentState!.validate() &&
        _formKeyPhoneNumber.currentState!.validate()) {
      Get.toNamed(
        MyRouter.otp,
        arguments:
            OTPScreenArguments(phoneNumber: '$dialCode${phoneController.text}'),
      );
    }
  }

  Column _buildRegisterFromField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _formKeyName,
          child: CustomTextFieldGroup(
            label: Strings.name.tr,
            placeholder: Strings.enterYourName.tr,
            focusNode: _focusName,
            isRequired: true,
            controller: nameController,
            maxLength: 30,
            placeholderSize: 14.sp,
            fontSize: 14.sp,
            keyboardType: TextInputType.name,
            validator: (value) {
              return ValidateUtils.validateFullName(value!);
            },
          ),
        ),
        SizedBox(height: 16.h),
        Form(
          key: _formKeyEmail,
          child: CustomTextFieldGroup(
            fontSize: 14.sp,
            label: Strings.email.tr,
            placeholder: Strings.enterYourEmail.tr,
            focusNode: _focusEmail,
            validator: (value) {
              return ValidateUtils.validateEmail(value!);
            },
            isRequired: true,
            controller: emailController,
            placeholderSize: 14.sp,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        SizedBox(height: 16.h),
        PhoneFieldWidget(
          formKeyPhoneNumber: _formKeyPhoneNumber,
          phoneController: phoneController,
          focusPhoneNumber: _focusPhoneNumber,
          onChanged: (String value) {
            dialCode = value;
          },
        ),
      ],
    );
  }
}
