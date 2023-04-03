import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';

class BorderWidget extends StatelessWidget {
  final Widget child;
  final Border border;
  final BorderRadiusGeometry? borderRadius;

  // ignore: use_key_in_widget_constructors
  BorderWidget({
    required this.child,
    Border? border,
    this.borderRadius,
  }) : border = border ?? Border.all(width: 1.r, color: ColorUtils.black86);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
      ),
    );
  }
}
