import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';

class StoreItem extends StatelessWidget {
  final String name;
  final String address;
  final double distance;
  final Color nameColor;
  final Color addressColor;
  final Color distanceColor;
  const StoreItem({
    Key? key,
    required this.name,
    required this.address,
    required this.distance,
    this.nameColor = ColorUtils.black86,
    this.addressColor = ColorUtils.black60,
    this.distanceColor = ColorUtils.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: SvgPicture.asset(
              'assets/images/ic_place.svg',
              width: 12.w,
              height: 15.h,
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyleUtils.body.copyWith(color: nameColor),
              ),
              Text(
                address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleUtils.footnote.copyWith(color: addressColor),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(3.r),
                child: Icon(
                  Icons.near_me,
                  color: ColorUtils.black86,
                  size: 15.sp,
                ),
              ),
              Text(
                (distance < 1) ? "${distance * 1000} m" : "$distance km",
                style: TextStyleUtils.productType.copyWith(
                  color: distanceColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
