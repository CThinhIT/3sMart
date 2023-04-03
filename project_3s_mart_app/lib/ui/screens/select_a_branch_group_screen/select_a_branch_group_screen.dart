import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iselect_a_branch_group_viewmodel.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/screens/select_branch_to_shop_screen/select_branch_to_shop_screen.dart';
import 'package:provider/provider.dart';
import 'widgets/supermarket_near_you.dart';

part 'widgets/branch_groups_list.dart';

class SelectABranchGroupScreen extends StatelessWidget {
  const SelectABranchGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.chooseASupermarket.tr,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.w, left: 16, right: 16),
            child: Text(
              '${Strings.hello.tr}, ${locator<GlobalData>().deviceInfo.userName}',
              style: TextStyleUtils.largeHeading2.copyWith(
                color: ColorUtils.primaryRedColor,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          const _BranchGroupsList(),
          SizedBox(height: 24.h),
          const SupermarketNearYouWidget(),
        ],
      ),
    );
  }
}
