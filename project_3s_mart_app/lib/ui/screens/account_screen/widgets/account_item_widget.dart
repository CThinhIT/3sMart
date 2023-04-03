import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';

class AccountItemWidget extends StatelessWidget {
  final String image;
  final String name;
  final void Function()? onPressed;
  final String? description;
  final Widget? child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  const AccountItemWidget({
    Key? key,
    required this.image,
    required this.name,
    this.onPressed,
    this.description,
    this.child = const Icon(
      Icons.navigate_next,
      color: ColorUtils.black60,
    ),
    this.color,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      onPressed: onPressed,
      child: Container(
        color: color,
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 17.h,
            ),
        child: Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(width: 11.w),
            Text(
              name,
              style: TextStyleUtils.button.copyWith(
                color: ColorUtils.black86,
              ),
            ),
            const Spacer(),
            description != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Text(
                      description!,
                      style: TextStyleUtils.body.copyWith(
                        color: ColorUtils.black40,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            child ??
                const Icon(
                  Icons.navigate_next,
                  color: ColorUtils.black60,
                ),
          ],
        ),
      ),
    );
  }
}
