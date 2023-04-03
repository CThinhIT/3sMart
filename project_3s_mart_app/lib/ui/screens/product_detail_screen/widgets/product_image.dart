part of '../product_detail_screen.dart';

class _ProductImage extends StatelessWidget {
  const _ProductImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0.r),
      child: Align(
        alignment: Alignment.center,
        child:

            /// TODO: Remove demo asset image
            imageUrl.contains('http')
                ? CachedNetworkImage(imageUrl: imageUrl, height: 200.h)
                : Image.asset(imageUrl, height: 200.h),
      ),
    );
  }
}
