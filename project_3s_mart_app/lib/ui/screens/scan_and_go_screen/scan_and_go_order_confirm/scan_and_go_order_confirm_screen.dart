import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/order_info_step2_screen/widgets/info_order_item.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/order_info_step2_screen/widgets/note_order.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/order_info_step2_screen/widgets/basket_item_orders_list.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/widgets/progress_order_info_widget.dart';
import 'package:provider/provider.dart';
part 'widgets/sub_total.dart';
part 'widgets/infomation_orders.dart';

class ScanAndGoOrderConfirmScreen extends StatelessWidget {
  const ScanAndGoOrderConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.confirmOrder.tr,
          isCancelEnabled: true,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<IBasketViewModel>(builder: (_, _viewModel, __) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProgressOrderInfoWidget(
                      currentOrderStep: ProgressOrderInfo.orderConfirmation,
                      isScanAndGoOrderProgress: true,
                    ),
                    const BasketItemOrdersList(),
                    _SubTotal(
                      discountValue: _viewModel.discountAmount,
                      totalPayment: _viewModel.totalPriceAfterDiscount,
                    ),
                    Divider(
                      thickness: 1.h,
                      height: 1.h,
                      color: ColorUtils.divider,
                    ),
                    const _InfomationOrders(),
                  ],
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              onPressed: () {
                Get.toNamed(MyRouter.directPaymentMethod);
              },
              height: 44.h,
              child: Text(
                Strings.lblGoNext.tr,
                style: TextStyleUtils.button.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
