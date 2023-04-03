import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/branch_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iselect_a_branch_group_viewmodel.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/screens/select_a_branch_group_screen/widgets/supermarket_near_you.dart';
import 'package:provider/provider.dart';

part 'widgets/list_of_branchs.dart';

class SelectBranchToShopScreen extends StatelessWidget {
  const SelectBranchToShopScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.branchGroup3SMart.tr,
        ),
      ),
      body: const _ListBranchs(),
    );
  }
}
