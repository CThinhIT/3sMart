import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class BranchCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  const BranchCard({Key? key, required this.imageUrl, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 24.w, 16.h),
      child: Center(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/images/ic_chinsu.png'),
                  fit: BoxFit.cover,
                ),
              ),
              width: 48.w,
              height: 48.w,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      Strings.providedBy.tr,
                      style: TextStyleUtils.footnoteSemiBold.copyWith(
                        color: ColorUtils.black86,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    name,
                    style: TextStyleUtils.buttonBold.copyWith(
                      color: ColorUtils.black86,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
