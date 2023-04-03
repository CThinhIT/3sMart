part of '../scan_and_go_introduction_screen.dart';

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/images/3SMart.svg'),
          SizedBox(height: 12.h),
          Text(
            Strings.scanAndGoWelcome.tr,
            style: TextStyleUtils.largeHeading2.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
