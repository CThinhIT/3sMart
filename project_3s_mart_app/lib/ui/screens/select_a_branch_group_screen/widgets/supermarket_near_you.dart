import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/branch_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iselect_a_branch_group_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:provider/provider.dart';

class SupermarketNearYouWidget extends StatelessWidget {
  const SupermarketNearYouWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            Strings.nearby.tr,
            style: TextStyleUtils.title,
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 150.h,
          child: Consumer<ISelectABranchGroupViewModel>(
            builder: (_, _viewModel, __) => ListView.builder(
              itemCount: _viewModel.branchsNearYouList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: index == 0
                    ? EdgeInsets.symmetric(horizontal: 16.w)
                    : EdgeInsets.only(right: 16.w),
                child: _BranchItem(
                  branch: _viewModel.branchsNearYouList[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BranchItem extends StatelessWidget {
  const _BranchItem({
    Key? key,
    required this.branch,
  }) : super(key: key);
  final BranchUIModel branch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      height: 130.h,
      child: RippleClickEffect(
        onPressed: () {
          /// TODO: Save selected supermarket
          Get.offNamedUntil(MyRouter.home,
              (route) => route.settings.name == MyRouter.selectPurchaseMethod);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.h,
              height: 70.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: AssetImage(
                      branch.image,
                    ),
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(height: 4.h),
            Text(
              branch.name,
              style: TextStyleUtils.footnote,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              branch.address,
              style: TextStyleUtils.desciption,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),
            Text(
              '${Strings.length.tr} ${branch.distance} km',
              style: TextStyleUtils.footnote.copyWith(
                color: ColorUtils.primaryRedColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
