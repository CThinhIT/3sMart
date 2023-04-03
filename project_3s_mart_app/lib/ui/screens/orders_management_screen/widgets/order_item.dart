part of '../orders_management_screen.dart';

class _OrderItem extends StatelessWidget {
  const _OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderUIModel order;

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      onPressed: () {
        Get.toNamed(MyRouter.orderDetail, arguments: order);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.ordersDetail.map((e) => e.products.name).join(', '),
              style: TextStyleUtils.bodyStrong,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.orderID.tr + order.orderID,
                      style: TextStyleUtils.body.copyWith(
                        color: ColorUtils.black60,
                      ),
                    ),
                    Text(
                      Strings.orderTime.tr +
                          DateFormat("HH:mm, dd/MM/yyyy")
                              .format(order.orderTime),
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
                  ],
                ),
                order.orderStatus == OrderStatus.successfullyPlaced ||
                        order.orderStatus ==
                            OrderStatus.successfullyDeliverded
                    ? const Icon(
                        Icons.check_circle_outlined,
                        color: Color(0xFF21D932),
                      )
                    : order.orderStatus == OrderStatus.cancelled
                        ? const Icon(
                            Icons.cancel_outlined,
                            color: Color(0xFFDA0B0B),
                          )
                        : SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/images/icon_progress.svg',
                                width: 20.w,
                                height: 20.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
