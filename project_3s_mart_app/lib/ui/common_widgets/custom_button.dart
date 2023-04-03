import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? height;
  final double minWidth;
  final Color? btnColor;
  final Color textColor;
  final double? btnRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color? borderColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    this.height,
    this.minWidth = double.infinity,
    this.btnColor = ColorUtils.primaryRedColor,
    this.textColor = Colors.white,
    this.btnRadius,
    this.padding,
    this.child,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color tmpBtnColor = btnColor ?? Colors.white;

    return ButtonTheme(
      minWidth: minWidth,
      height: height ?? 44.h,
      child: FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        padding: padding,
        color: tmpBtnColor,
        textColor: textColor,
        disabledColor: Colors.grey[400],
        disabledTextColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnRadius ?? 8.r),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderColor != null ? 1.w : 0,
            style: BorderStyle.solid,
          ),
        ),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
