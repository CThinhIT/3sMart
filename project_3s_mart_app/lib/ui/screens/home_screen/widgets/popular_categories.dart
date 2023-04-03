part of '../home_screen.dart';

class _PopularCategories extends StatelessWidget {
  const _PopularCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.popularCategories.tr,
            style: TextStyleUtils.title,
          ),
          SizedBox(height: 10.h),
          Consumer<IHomeViewModel>(
            builder: (_, _viewModel, __) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (index) => _PopularCategoryItem(
                        image: _viewModel.listPopularCategories[index].imageUrl,
                        name: _viewModel.listPopularCategories[index].name,
                        subcategoryId:
                            _viewModel.listPopularCategories[index].id,
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (index) => index + 4 == 7
                          ? const _MoreItem()
                          : _PopularCategoryItem(
                              image: _viewModel
                                  .listPopularCategories[4 + index].imageUrl,
                              name: _viewModel
                                  .listPopularCategories[4 + index].name,
                              subcategoryId: _viewModel
                                  .listPopularCategories[4 + index].id,
                            ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PopularCategoryItem extends StatelessWidget {
  final String subcategoryId;
  final String image;
  final String name;
  const _PopularCategoryItem({
    Key? key,
    required this.image,
    required this.name,
    required this.subcategoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          MyRouter.productCategory,
          arguments: ProductFilterArguments(
            subcategoryId: subcategoryId,
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 74.r,
            width: 74.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: TextStyleUtils.footnoteBold,
          ),
        ],
      ),
    );
  }
}

class _MoreItem extends StatelessWidget {
  const _MoreItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(MyRouter.category);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 74.r,
            width: 74.r,
            decoration: BoxDecoration(
              color: ColorUtils.primaryRedColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              Icons.more_horiz,
              size: 30.r,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            Strings.viewMore.tr,
            overflow: TextOverflow.ellipsis,
            style: TextStyleUtils.footnoteBold,
          ),
        ],
      ),
    );
  }
}
