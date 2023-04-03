import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';

import 'custom_button.dart';

class WeightItem extends StatelessWidget {
  const WeightItem({
    Key? key,
    required this.onPressed,
    required this.weight,
    required this.active,
  }) : super(key: key);

  final VoidCallback onPressed;
  final double weight;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      child: Text(
        '${weight < 1 ? weight : weight.toStringAsFixed(0)} Kg',
        style: TextStyleUtils.button,
      ),
      textColor: active ? Colors.white : ColorUtils.black,
      btnColor: active ? ColorUtils.primaryRedColor : Colors.white,
      borderColor: active ? ColorUtils.primaryRedColor : ColorUtils.black40,
      minWidth: 64.w,
      height: 36.h,
      btnRadius: 8.r,
      
    );
  }
}

List<double> listWeights = [0.3, 0.5, 1];
