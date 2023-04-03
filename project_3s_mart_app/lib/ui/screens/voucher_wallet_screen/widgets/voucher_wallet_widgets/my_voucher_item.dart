import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/date_time_extension.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';

class MyVoucherItem extends StatelessWidget {
  final String name;
  final String brand;
  final String imageUrl;
  final DateTime date;
  final VoidCallback onPressed;

  const MyVoucherItem({
    Key? key,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.date,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 9.h, 0, 7.h),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(16.w, 0, 8.w, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/voucher_header.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 76.h,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(7.w, 0, 12.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      brand,
                      style: TextStyleUtils.desciption.copyWith(
                        color: ColorUtils.black86,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 4.h, 0, 8.h),
                      child: Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleUtils.footnoteSemiBold.copyWith(
                          color: ColorUtils.black86,
                        ),
                      ),
                    ),
                    Text(
                      "${Strings.expirationDate.tr}${date.toDateString()}",
                      style: TextStyleUtils.footnoteSemiBold.copyWith(
                        color: ColorUtils.primaryRedColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
