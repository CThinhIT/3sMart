import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/utils/validate_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    Key? key,
    required this.formKeyPhoneNumber,
    required this.phoneController,
    required this.onChanged,
    this.focusPhoneNumber,
    this.flagImage,
  }) : super(key: key);

  final GlobalKey<FormState> formKeyPhoneNumber;
  final TextEditingController phoneController;
  final FocusNode? focusPhoneNumber;
  final String? flagImage;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(children: <InlineSpan>[
            TextSpan(
              text: Strings.phoneNumer.tr,
              style: TextStyleUtils.body,
            ),
            TextSpan(
              text: '*',
              style: TextStyleUtils.body.copyWith(
                color: ColorUtils.primaryRedColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            CountryCodePicker(
              onChanged: onChanged,
              initialSelection: 'VN',
              hintText: Strings.enterCountryNameOrCountryCode.tr,
              notFound: Strings.noCountryFound.tr,
              title: Strings.searchCountryCode.tr,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Form(
                key: formKeyPhoneNumber,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: phoneController,
                  focusNode: focusPhoneNumber,
                  validator: (value) {
                    return ValidateUtils.validatePhoneNumber(value!);
                  },
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                  decoration: InputDecoration(
                    hintText: Strings.enterYourphoneNumer.tr,
                    hintStyle: TextStyleUtils.button.copyWith(
                      color: ColorUtils.black60,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 4.h),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
