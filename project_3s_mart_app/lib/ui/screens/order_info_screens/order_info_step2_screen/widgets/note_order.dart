import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class Note extends StatelessWidget {
  const Note({
    Key? key,
    required this.note,
  }) : super(key: key);
  final String note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.note.tr,
            style: TextStyleUtils.subHeading.copyWith(
              color: ColorUtils.black60,
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            note,
            style: TextStyleUtils.subHeading.copyWith(
              color: ColorUtils.black86,
            ),
          ),
        ],
      ),
    );
  }
}
