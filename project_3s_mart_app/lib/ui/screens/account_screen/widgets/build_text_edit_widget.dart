import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';

class BuildTextFormFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final VoidCallback? onCompleted;
  final String? Function(String?)? onValidate;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final GlobalKey<FormState>? formkey;
  final int maxLine;
  final String? hintText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onChangedForm;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final Widget? suffixIcon;
  final String? labelTextWithRequire;
  final bool? enabled;
  const BuildTextFormFieldWidget({
    Key? key,
    this.labelText,
    this.initialValue,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onCompleted,
    this.onValidate,
    this.focusNode,
    this.formkey,
    this.maxLine = 1,
    this.onChanged,
    this.onChangedForm,
    this.hintText,
    this.maxLength,
    this.inputFormatters,
    this.onSaved,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
    this.labelTextWithRequire,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      onChanged: onChangedForm,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: focusNode,
        readOnly: readOnly,
        textInputAction: textInputAction,
        onEditingComplete: onCompleted,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        keyboardType: keyboardType,
        style: TextStyleUtils.button.copyWith(
          color: ColorUtils.primaryBlackColor,
        ),
        initialValue: initialValue,
        onTap: onTap,
        controller: controller,
        validator: onValidate,
        maxLines: maxLine,
        onChanged: onChanged,
        onSaved: onSaved,
        decoration: InputDecoration(
          counterText: "",
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyleUtils.button.copyWith(
            color: ColorUtils.black60,
          ),
          errorStyle: TextStyleUtils.subHeading.copyWith(
            fontSize: 11.sp,
          ),
          labelText: labelText,
          labelStyle: TextStyleUtils.subHeading.copyWith(
            color: ColorUtils.black60,
            height: 1.2.h,
          ),
          suffixIcon: suffixIcon,
          label: labelTextWithRequire != null
              ? Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: labelTextWithRequire,
                        style: TextStyleUtils.subHeading.copyWith(
                          color: ColorUtils.black60,
                          height: 1.2.h,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyleUtils.subHeading.copyWith(
                          color: ColorUtils.primaryRedColor,
                          height: 1.2.h,
                        ),
                      ),
                    ],
                  ),
                )
              : null,
        ),
        enabled: enabled,
      ),
    );
  }
}
