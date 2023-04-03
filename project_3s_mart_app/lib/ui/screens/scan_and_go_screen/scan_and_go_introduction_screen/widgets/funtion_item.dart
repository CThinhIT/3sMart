part of '../scan_and_go_introduction_screen.dart';

class _FunctionItem extends StatelessWidget {
  final String svgIconAsset;
  final String title;
  final String description;

  const _FunctionItem({
    Key? key,
    required this.svgIconAsset,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgIconAsset,
            color: ColorUtils.black,
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyleUtils.heading3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            description,
            style: TextStyleUtils.subHeading.copyWith(
              color: ColorUtils.black60,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
