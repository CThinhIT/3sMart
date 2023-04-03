part of '../order_detail_screen.dart';


class _RecipientInfo extends StatelessWidget {
  const _RecipientInfo({
    Key? key,
    required this.info,
  }) : super(key: key);
  final RecipientInformationUIModel info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.recipientInfo.tr,
            style: TextStyleUtils.title.copyWith(color: ColorUtils.black),
          ),
          SizedBox(height: 6.h),
          Text(
            info.fullName,
            style: TextStyleUtils.body.copyWith(
              color: ColorUtils.black60,
            ),
          ),
          Text(
            info.phoneNumber,
            style: TextStyleUtils.body.copyWith(
              color: ColorUtils.black60,
            ),
          ),
          Text(
            info.address,
            style: TextStyleUtils.body.copyWith(
              color: ColorUtils.black60,
            ),
          ),
        ],
      ),
    );
  }
}