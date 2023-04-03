part of '../home_screen.dart';

class _Promotions extends StatelessWidget {
  const _Promotions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            top: 7.w,
            bottom: 16.h,
            right: 16.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.promotions.tr,
                style: TextStyleUtils.title,
              ),
              RippleClickEffect(
                onPressed: () {
                  Get.toNamed(
                    MyRouter.voucherWallet,
                    arguments: 1,
                  );
                },
                child: Text(
                  Strings.viewAll.tr,
                  style: TextStyleUtils.button.copyWith(
                    color: ColorUtils.primaryRedColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 125.h,
          child: Consumer<IHomeViewModel>(builder: (_, _viewModel, __) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: _viewModel.listPromotions.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: index != 4
                    ? EdgeInsets.only(left: 16.w)
                    : EdgeInsets.symmetric(horizontal: 16.w),
                child: _PromotionItem(
                  image: _viewModel.listPromotions[index],
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}

class _PromotionItem extends StatelessWidget {
  const _PromotionItem({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          MyRouter.voucherWallet,
          arguments: 1,
        );
      },
      child: Container(
        height: 125.h,
        width: 242.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            )),
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
