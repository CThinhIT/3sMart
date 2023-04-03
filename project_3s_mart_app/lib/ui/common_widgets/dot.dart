import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';

class Dot extends StatelessWidget {
  final bool active;
  const Dot({Key? key, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: active
              ? Border.all(color: ColorUtils.primaryRedColor, width: 4.r)
              : Border.all(color: Colors.grey)),
    );
  }
}
