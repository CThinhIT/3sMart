import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleProgressWidget extends StatelessWidget {
  final double size;
  final Color color;
  final double strokeWidth;

  // ignore: use_key_in_widget_constructors
  CircleProgressWidget({
    double? size,
    double? strokeWidth,
    this.color = Colors.white,
  })  : size = size ?? 24.r,
        strokeWidth = strokeWidth ?? 2.r;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
