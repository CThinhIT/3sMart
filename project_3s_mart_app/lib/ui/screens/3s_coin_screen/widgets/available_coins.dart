import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icoin_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:provider/provider.dart';

class AvailableCoins extends StatelessWidget {
  final bool isExchangeCoinBtnShown;

  // ignore: use_key_in_widget_constructors
  const AvailableCoins({this.isExchangeCoinBtnShown = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/ic_3s_coin.svg'),
          SizedBox(width: 12.w),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Strings.availableCoins.tr,
                  style: TextStyleUtils.footnoteSemiBold),
              Consumer<ICoinViewModel>(
                builder: (_, vm, __) => Text(
                  vm.availableCoins.toString(),
                  style: TextStyleUtils.bodyStrong.copyWith(
                    color: ColorUtils.primaryRedColor,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          isExchangeCoinBtnShown
              ? InkWell(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Image.asset('assets/images/ic_right_arrow.png'),
                  onTap: () {
                    Get.toNamed(MyRouter.exchangeCoin);
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
