part of '../home_screen.dart';

class _MyBanner extends StatelessWidget {
  const _MyBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Consumer<IHomeViewModel>(builder: (_, _viewModel, __) {
        return PageView.builder(
          controller: PageController(viewportFraction: 0.85, initialPage: 1),
          itemCount: _viewModel.listBanner.length,
          allowImplicitScrolling: true,
          itemBuilder: (context, index) => _BannerItem(
            image: _viewModel.listBanner[index],
          ),
        );
      }),
    );
  }
}

class _BannerItem extends StatelessWidget {
  const _BannerItem({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      height: 125.h,
      width: 328.w,
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
