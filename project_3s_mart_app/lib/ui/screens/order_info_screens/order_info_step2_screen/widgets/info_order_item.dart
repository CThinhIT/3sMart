import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';

class InfoOrderItem extends StatelessWidget {
  const InfoOrderItem({
    Key? key,
    required this.subInfo,
    this.subInfo2,
    required this.titleInfo,
  }) : super(key: key);
  final String subInfo;
  final String? subInfo2;
  final String titleInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleInfo,
            style: TextStyleUtils.foontoteMedium.copyWith(
              color: ColorUtils.black60,
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  subInfo,
                  textAlign: TextAlign.end,
                  style: TextStyleUtils.foontoteMedium.copyWith(
                    color: ColorUtils.black86,
                  ),
                  maxLines: 2,
                  softWrap: true,
                ),
                subInfo2 != null
                    ? Text(
                        subInfo2!,
                        textAlign: TextAlign.end,
                        style: TextStyleUtils.foontoteMedium.copyWith(
                          color: ColorUtils.black86,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
