import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/order_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/screens/orders_management_screen/widgets/dot_outline.dart';
import 'package:project_3s_mart_app/ui/screens/orders_management_screen/widgets/order_includes.dart';
part 'widgets/shipping_status_widget.dart';
part 'widgets/name_status.dart';
class TrackYourOrderScreen extends StatelessWidget {
  const TrackYourOrderScreen({
    Key? key,
    required this.order,
  }) : super(key: key);
  final OrderUIModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.trackYourOrder.tr,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ShippingStatusWidget(order: order),
            SizedBox(height: 16.h),
            Divider(
              thickness: 2.h,
              color: const Color(0xFFE2E2E2),
              height: 0,
            ),
            OrderIncludes(ordersDetail: order.ordersDetail)
          ],
        ),
      ),
    );
  }
}

