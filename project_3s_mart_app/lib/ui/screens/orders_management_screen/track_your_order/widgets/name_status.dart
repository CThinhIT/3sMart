
part of '../track_your_order_screen.dart';
class _NameStatus extends StatelessWidget {
  final String name;
  final String sub;
  final bool isDividerEnabled;
  const _NameStatus({
    Key? key,
    required this.name,
    required this.sub,
    this.isDividerEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyleUtils.bodyStrong.copyWith(
            color: ColorUtils.black86,
          ),
        ),
        Text(
          sub,
          style: TextStyleUtils.footnoteSemiBold.copyWith(
            color: ColorUtils.black60,
          ),
        ),
        isDividerEnabled
            ? Divider(
                thickness: 1.5.h,
                color: ColorUtils.divider,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
