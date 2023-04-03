part of '../select_a_branch_group_screen.dart';

class _BranchGroupsList extends StatelessWidget {
  const _BranchGroupsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.msgselecteSupermarket.tr,
            style: TextStyleUtils.subHeading.copyWith(
              color: ColorUtils.black60,
            ),
          ),
          SizedBox(height: 20.h),
          Consumer<ISelectABranchGroupViewModel>(
            builder: (_, _viewModel, __) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 4,
              ),
              itemCount: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.toNamed(
                    MyRouter.selectBranchToShop,
                  );
                },
                child: _GroupItem(
                  image: _viewModel.branchGroupsList[index].image,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GroupItem extends StatelessWidget {
  final String image;
  const _GroupItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74.r,
      width: 74.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
