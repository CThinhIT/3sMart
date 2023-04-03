part of '../order_detail_screen.dart';

class _OrderInfo extends StatelessWidget {
  const _OrderInfo({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderUIModel order;

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
            Strings.orderID.tr + order.orderID,
            style: TextStyleUtils.title.copyWith(color: ColorUtils.black),
          ),
          SizedBox(height: 6.h),
          Text(
            Strings.orderTime.tr +
                DateFormat("HH:mm, dd/MM/yyyy").format(order.orderTime),
            style: TextStyleUtils.body.copyWith(
              color: ColorUtils.black60,
            ),
          ),
          Text(
            Strings.orderStatus.tr +
                EnumHelper.getDescription(
                    EnumMap.orderStatusValue, order.orderStatus),
            style: TextStyleUtils.body.copyWith(
              color: ColorUtils.black60,
            ),
          ),
          Text(
            Strings.saleBranch.tr + order.saleBranch,
            style: TextStyleUtils.body.copyWith(
              color: ColorUtils.black60,
            ),
          ),
        ],
      ),
    );
  }
}
