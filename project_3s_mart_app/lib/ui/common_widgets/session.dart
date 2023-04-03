import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final Function()? onViewAllPressed;
  final Widget child;
  final double titleToChildSpace;

  // ignore: use_key_in_widget_constructors
  const SectionWidget({
    required this.child,
    required this.title,
    this.titleToChildSpace = 0,
    this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.r, top: 16.r, right: 16.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyleUtils.title),
              onViewAllPressed != null
                  ? RippleClickEffect(
                      onPressed: onViewAllPressed,
                      child: Text(
                        Strings.viewAll.tr,
                        style: TextStyleUtils.button
                            .copyWith(color: ColorUtils.primaryRedColor),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        SizedBox(height: titleToChildSpace),
        child,
      ],
    );
  }
}
