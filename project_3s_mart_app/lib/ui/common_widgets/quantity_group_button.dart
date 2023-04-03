import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/ui/common_widgets/add_cart_anim/add_cart_anim_on_press_widget.dart';

import 'ripple_click_effect.dart';

class QuantityGroupButton extends StatelessWidget {
  final int currentValue;
  final VoidCallback? onDecrease;
  final VoidCallback onIncrease;
  final ProductUIModel product;
  final bool enableAddCartAnim;
  
  const QuantityGroupButton({
    Key? key,
    required this.currentValue,
    required this.onDecrease,
    required this.onIncrease,
    required this.product,
    this.enableAddCartAnim = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: Row(
        children: [
          AddCartAnimOnPressedWidget(
            enabled: enableAddCartAnim,
            product: product,
            reverseAnim: true,
            child: RippleClickEffect(
              onPressed: onDecrease,
              child: Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.transparent,
                  border: Border.all(
                    color: ColorUtils.black40,
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.remove,
                  color: onDecrease != null
                      ? ColorUtils.black86
                      : Colors.grey.withOpacity(0.4),
                  size: 24.r,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Container(
            width: 32.r,
            height: 32.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: ColorUtils.black40,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                '$currentValue',
                style: TextStyleUtils.button,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          AddCartAnimOnPressedWidget(
            enabled: enableAddCartAnim,
            product: product,
            child: RippleClickEffect(
              onPressed: onIncrease,
              child: Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.transparent,
                  border: Border.all(
                    color: ColorUtils.black40,
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: ColorUtils.black86,
                  size: 24.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
