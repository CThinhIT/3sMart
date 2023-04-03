import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';

import 'custom_button.dart';

class ButtonBottom extends StatelessWidget {
  const ButtonBottom({
    Key? key,
    required this.onPressed,
    required this.title,
    this.hint,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String title;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          thickness: 0.5.h,
          height: 0.h,
          color: ColorUtils.divider,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            top: hint == null ? 16.h : 8.h,
            bottom: 24.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              hint != null
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Text(
                        hint!,
                        style: TextStyleUtils.body.copyWith(
                          color: ColorUtils.black60,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              CustomButton(
                onPressed: onPressed,
                height: 44.h,
                child: Text(
                  title,
                  style: TextStyleUtils.button.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
