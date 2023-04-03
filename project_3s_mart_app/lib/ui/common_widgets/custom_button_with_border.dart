import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';

import 'dot.dart';

class ButtonBorderWithDot extends StatelessWidget {
  const ButtonBorderWithDot({
    Key? key,
    required this.active,
    required this.onPressed,
    this.name,
    this.image,
    this.btnColor,
    this.dot,
    this.btnHeight = 48,
    this.child,
  }) : super(key: key);

  final bool active;
  final VoidCallback onPressed;
  final String? name;
  final String? image;
  final double btnHeight;
  final Widget? dot;
  final Color? btnColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      btnColor: btnColor ??
          (active ? ColorUtils.activeButtonBackgroudColor : ColorUtils.white),
      height: btnHeight,
      btnRadius: 8.r,
      borderColor: active ? ColorUtils.primaryRedColor : ColorUtils.borderColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          child ??
              Row(
                children: [
                  Image.asset(
                    image!,
                    height: 30.h,
                    width: 30.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    name!,
                    style: TextStyleUtils.buttonBold
                        .copyWith(color: ColorUtils.primaryBlackColor),
                  ),
                ],
              ),
          dot ??
              SizedBox(
                width: 20.w,
                height: 20.w,
                child: Center(
                  child: Dot(active: active),
                ),
              ),
        ],
      ),
    );
  }
}
