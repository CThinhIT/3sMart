part of '../product_detail_screen.dart';

class _ProductDescription extends StatelessWidget {
  const _ProductDescription({
    Key? key,
    this.description,
  }) : super(key: key);
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.productInfo.tr,
            style: TextStyleUtils.title,
          ),
          SizedBox(height: 5.h),
          Text(
            description ?? '',
            style: TextStyleUtils.subHeading2,
          ),
        ],
      ),
    );
  }
}