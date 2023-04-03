part of '../track_your_order_screen.dart';

class _ShippingStatusWidget extends StatelessWidget {
  const _ShippingStatusWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderUIModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.shippingStatus.tr,
            style: TextStyleUtils.title.copyWith(
              color: ColorUtils.black86,
            ),
          ),
          SizedBox(height: 18.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ShippingStatus.values.length,
            itemBuilder: (context, index) {
              final String shippingStatusValue = EnumHelper.getDescription(
                  EnumMap.shippingStatusValue,
                  ShippingStatus.values[index]);

              return Opacity(
                opacity:
                    ShippingStatus.values[index] == order.shippingStatus
                        ? 1
                        : 0.38,
                child: _StatusItem(
                  name: shippingStatusValue.tr,
                  sub: '${shippingStatusValue}Sub'.tr,
                  isActive:
                      ShippingStatus.values[index] == order.shippingStatus,
                  onlyDot: index == ShippingStatus.values.length - 1,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final String name;
  final String sub;
  final bool isActive;
  final bool onlyDot;
  const _StatusItem({
    required this.name,
    required this.sub,
    required this.isActive,
    this.onlyDot = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !onlyDot
            ? Column(
                children: [
                  DotOutline(
                    isOutLineBorderEnabled: isActive,
                  ),
                  const VerticalLine(),
                ],
              )
            : DotOutline(
                isOutLineBorderEnabled: isActive,
              ),
        SizedBox(width: 16.w),
        Expanded(
          child: _NameStatus(
            name: name,
            sub: sub,
            isDividerEnabled: !onlyDot,
          ),
        ),
      ],
    );
  }
}

