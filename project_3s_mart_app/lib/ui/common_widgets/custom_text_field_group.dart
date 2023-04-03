import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';

class CustomTextFieldGroup extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? placeholder;
  final bool isRequired;
  final int maxLines;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool readOnly;
  final bool isFocus;
  final bool enabled;
  final int? maxLength;
  final Function()? onTap;
  final Widget? suffixIcon;
  final double placeholderSize;

  final double fontSize;
  final bool isTitleCenter;
  final bool isContentCenter;

  const CustomTextFieldGroup({
    Key? key,
    required this.controller,
    this.label,
    this.placeholder,
    this.isRequired = false,
    this.maxLines = 1,
    this.initialValue,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
    required this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLength,
    this.onTap,
    this.suffixIcon,
    this.isFocus = false,
    this.placeholderSize = 16,
    this.fontSize = 14,
    this.isContentCenter = false,
    this.isTitleCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isTitleCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyleUtils.body,
              ),
              TextSpan(
                text: isRequired == true ? '*' : '',
                style: TextStyleUtils.body.copyWith(
                  color: ColorUtils.primaryRedColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        TextFormField(
          textAlign: isContentCenter ? TextAlign.center : TextAlign.left,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          initialValue: initialValue,
          maxLines: maxLines,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          focusNode: focusNode,
          obscureText: obscureText,
          readOnly: readOnly,
          enabled: enabled,
          onTap: onTap,
          style: TextStyle(
            fontSize: fontSize,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 4),
            hintText: placeholder,
            counterText: "",
            hintStyle: TextStyleUtils.button.copyWith(
              color: ColorUtils.black60,
            ),
            isDense: true,
            suffixIcon: suffixIcon,
          ),
        )
      ],
    );
  }
}
