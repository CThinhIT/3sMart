import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/order_detail_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class OrderIncludes extends StatelessWidget {
  const OrderIncludes({
    Key? key,
    required this.ordersDetail,
  }) : super(key: key);

  final List<OrderDetailUIModel> ordersDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        top: 10.h,
        bottom: 10.h,
        right: 5.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.yourOrderIncludes.tr,
            style: TextStyleUtils.title.copyWith(color: ColorUtils.black),
          ),
          SizedBox(height: 6.h),
          ListView.separated(
            itemCount: ordersDetail.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: _ProductOrderItem(orderDetail: ordersDetail[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 1.h,
                thickness: 0.5,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProductOrderItem extends StatelessWidget {
  const _ProductOrderItem({
    Key? key,
    required this.orderDetail,
  }) : super(key: key);

  final OrderDetailUIModel orderDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: AssetImage(
                  orderDetail.products.imageUrl,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    orderDetail.products.name,
                    style: TextStyleUtils.productType,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${Strings.quantity.tr} : ${orderDetail.quantity}',
                    style: TextStyleUtils.footnoteSemiBold.copyWith(
                      color: ColorUtils.black60,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
