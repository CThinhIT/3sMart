import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/branch_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/common_widgets/store_item.dart';

class ApplicableStores extends StatelessWidget {
  final List<BranchUIModel> stores;
  final Color? color;
  const ApplicableStores({Key? key, required this.stores, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 24.w, 16.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.applicablePromoStores.tr,
                style: TextStyleUtils.bodyStrong,
              ),
              if (stores.length > 1)
                RippleClickEffect(
                  onPressed: () {
                    Get.toNamed(MyRouter.applicableStores, arguments: stores);
                  },
                  child: Row(
                    children: [
                      Opacity(
                        opacity: 0.6,
                        child: Text(
                          "+${stores.length - 1} ${Strings.stores.tr}",
                          style: TextStyleUtils.footnoteSemiBold,
                        ),
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 11.sp,
                        color: ColorUtils.black40,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          StoreItem(
            name: stores[0].name,
            address: stores[0].address,
            distance: stores[0].distance,
          ),
        ],
      ),
    );
  }
}
