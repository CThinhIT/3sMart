part of '../home_screen.dart';

class _BranchToShop extends StatelessWidget {
  const _BranchToShop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFDA44),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              AppTranslation.translateTemplate(
                Strings.currentBranch.tr,
                {'currentBranch': locator<GlobalData>().deviceInfo.branchName},
              ),
              style: TextStyleUtils.bodyStrong.copyWith(
                color: ColorUtils.primaryRedColor,
              ),
            ),
          ),
          RippleClickEffect(
            onPressed: () {
              Get.toNamed(MyRouter.selectABranchGroup);
            },
            child: Text(
              Strings.changeStore.tr,
              style: TextStyleUtils.bodyStrong.copyWith(
                color: ColorUtils.primaryBlackColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
