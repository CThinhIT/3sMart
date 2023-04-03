import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class MoreBodyBottomSheet extends StatelessWidget {
  const MoreBodyBottomSheet({
    Key? key,
    required this.onPressItem1,
    required this.onPressItem2,
    required this.textItem1,
    required this.textItem2,
  }) : super(key: key);

  final VoidCallback onPressItem1;
  final VoidCallback onPressItem2;
  final String textItem1;
  final String textItem2;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(14.r),
              ),
              color: ColorUtils.white.withOpacity(0.8),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: onPressItem1,
                  child: SizedBox(
                    height: 56.h,
                    child: Center(
                      child: Text(
                        textItem1,
                        textAlign: TextAlign.center,
                        style: TextStyleUtils.largeHeading2
                            .copyWith(color: ColorUtils.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Divider(
                    color: ColorUtils.disableColor,
                    height: 1.h,
                  ),
                ),
                InkWell(
                  onTap: onPressItem2,
                  child: SizedBox(
                    height: 56.h,
                    child: Center(
                      child: Text(
                        textItem2,
                        style: TextStyleUtils.largeHeading2.copyWith(
                          color: const Color(0xFFFF3E33),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 56.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(14.r),
              ),
              color: ColorUtils.white,
            ),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Center(
                child: Text(
                  Strings.lblSkip.tr,
                  style: TextStyleUtils.largeHeading2.copyWith(
                    color: ColorUtils.blue,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
