part of '../order_info_step1_screen.dart';

class _DeliveryTime extends StatelessWidget {
  const _DeliveryTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.deliveryTime.tr,
                style: TextStyleUtils.title.copyWith(
                  color: ColorUtils.primaryBlackColor,
                ),
              ),
              InkWell(
                onTap: () => showCupertinoModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const _BodyOfDraggableForDeliveryTime(),
                ),
                child: Text(
                  Strings.change.tr,
                  style: TextStyleUtils.title.copyWith(
                    color: ColorUtils.primaryRedColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: Strings.estimatedDeliveryTime.tr + ': ',
                  style: TextStyleUtils.footnoteSemiBold.copyWith(
                    color: ColorUtils.black86,
                  ),
                ),
                TextSpan(
                  text: Strings.within2hour.tr,
                  style: TextStyleUtils.footnoteSemiBold.copyWith(
                    color: ColorUtils.primaryRedColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      //TODO
                    },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: Strings.standardDelivery.tr + ' ',
                  style: TextStyleUtils.footnoteSemiBold.copyWith(
                    color: ColorUtils.black86,
                  ),
                ),
                TextSpan(
                  text: Strings.deliveryPolicy.tr,
                  style: TextStyleUtils.footnoteSemiBold.copyWith(
                    color: ColorUtils.primaryRedColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      //TODO
                    },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
