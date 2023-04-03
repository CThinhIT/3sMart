part of '../select_branch_to_shop_screen.dart';

class _ListBranchs extends StatelessWidget {
  const _ListBranchs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Strings.chooseABranchToPurchase.tr,
                style: TextStyleUtils.title,
              ),
              RippleClickEffect(
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.question_circle,
                  color: Color(0xFF3771F4),
                  size: 26,
                ),
              )
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          height: 0,
        ),
        Consumer<ISelectABranchGroupViewModel>(builder: (_, _viewModel, __) {
          return Expanded(
            child: ListView.builder(
                itemCount: _viewModel.branchsList.length,
                itemBuilder: (context, index) => _BranchToShopItem(
                      branch: _viewModel.branchsList[index],
                    )),
          );
        }),
        SizedBox(height: 10.h),
        const SupermarketNearYouWidget(),
      ],
    );
  }
}

class _BranchToShopItem extends StatelessWidget {
  final BranchUIModel branch;
  const _BranchToShopItem({
    Key? key,
    required this.branch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      onPressed: () {
        locator<GlobalData>().deviceInfo.branchName = branch.name;
        Get.offNamedUntil(MyRouter.home,
            (route) => route.settings.name == MyRouter.selectPurchaseMethod);
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: DecorationImage(
                      image: AssetImage(branch.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        branch.name,
                        style: TextStyleUtils.body,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '${Strings.length.tr} ${branch.distance} km',
                        style: TextStyleUtils.footnote.copyWith(
                          color: ColorUtils.primaryRedColor,
                        ),
                      )
                    ],
                  ),
                ),
                const Icon(Icons.navigate_next)
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
        ],
      ),
    );
  }
}
