import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';
import 'package:project_3s_mart_app/core/ui_models/order_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/recipient_information.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/screens/orders_management_screen/widgets/dot_outline.dart';
import 'package:project_3s_mart_app/ui/screens/orders_management_screen/widgets/order_includes.dart';
part 'widgets/order_info.dart';
part 'widgets/recipient_info.dart';
part 'widgets/shipping_option.dart';
part 'widgets/shipping_status.dart';
part 'widgets/payment_method.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key, required this.order}) : super(key: key);
  final OrderUIModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.myOrders.tr,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _OrderInfo(
              order: order,
            ),
            Divider(
              color: ColorUtils.divider,
              thickness: 2,
              height: 1.h,
            ),
            _RecipientInfo(
              info: order.recipientInfo,
            ),
            Divider(
              color: ColorUtils.divider,
              thickness: 2,
              height: 1.h,
            ),
            _ShippingOption(
              shippingOption: order.shippingOption,
            ),
            Divider(
              color: ColorUtils.divider,
              thickness: 2,
              height: 1.h,
            ),
            _ShippingStatus(order: order),
            Divider(
              color: ColorUtils.divider,
              thickness: 2,
              height: 1.h,
            ),
            _PaymentMethod(
              paymentMethodValue: order.paymentMethod,
            ),
            Divider(
              color: ColorUtils.divider,
              thickness: 2,
              height: 1.h,
            ),
            OrderIncludes(
              ordersDetail: order.ordersDetail,
            ),
          ],
        ),
      ),
    );
  }
}
