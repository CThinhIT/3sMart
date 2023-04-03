part of '../order_detail_screen.dart';


class _ShippingStatus extends StatelessWidget {
  const _ShippingStatus({
    Key? key,
    required this.order,
  }) : super(key: key);
  final OrderUIModel order;

  @override
  Widget build(BuildContext context) {
    final String shippingStatusValue = EnumHelper.getDescription(
        EnumMap.shippingStatusValue, order.shippingStatus);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.shippingStatus.tr,
            style: TextStyleUtils.title.copyWith(
              color: ColorUtils.black,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const DotOutline(),
                  Container(
                    color: ColorUtils.black.withOpacity(0.2),
                    height: 31.h,
                    width: 1.w,
                  ),
                ],
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shippingStatusValue.tr,
                    style: TextStyleUtils.bodyStrong.copyWith(
                      color: const Color(0xFF3771F4),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${shippingStatusValue}Sub'.tr,
                    style: TextStyleUtils.footnote.copyWith(
                      color: ColorUtils.black40,
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              onPressed: () {
                Get.toNamed(MyRouter.trackYourOrder, arguments: order);
              },
              height: 44.h,
              minWidth: 200.w,
              child: Text(
                Strings.trackYourOrder.tr,
                style: TextStyleUtils.button,
              ),
              btnColor: const Color(0xFF3771F4),
              btnRadius: 8.r,
            ),
          ),
        ],
      ),
    );
  }
}
