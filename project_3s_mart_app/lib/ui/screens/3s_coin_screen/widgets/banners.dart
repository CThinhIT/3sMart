part of '../coin_screen.dart';

class _Banners extends StatelessWidget {

  // ignore: use_key_in_widget_constructors
  const _Banners();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Consumer<ICoinViewModel>(
          builder: (_, vm, __) {
              return PageView.builder(
              controller: PageController(viewportFraction: 0.85, initialPage: 1),
              itemCount: vm.bannerImageUrls.length,
              allowImplicitScrolling: true,
              itemBuilder: (context, index) => _BannerItem(
                imageUrl: vm.bannerImageUrls[index],
              ),
            );
          },
      ),
    );
  }
}

class _BannerItem extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const _BannerItem({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      height: 125.h,
      width: 328.w,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
