import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/button_bottom.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/order_info_step2_screen/widgets/note_order.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/widgets/progress_order_info_widget.dart';
import 'package:provider/provider.dart';
import 'widgets/basket_item_orders_list.dart';
import 'widgets/info_order_item.dart';
part 'widgets/sub_total.dart';
part 'widgets/infomation_orders.dart';

class OrderInfoStep2Screen extends StatelessWidget {
  const OrderInfoStep2Screen({
    Key? key,
    required this.purchaseMethod,
  }) : super(key: key);
  final PurchaseMethod purchaseMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.confirmOrder.tr,
        ),
      ),
      body: Consumer<IBasketViewModel>(builder: (_, _viewModel, __) {
        return ListView(
          children: [
            ProgressOrderInfoWidget(
              currentOrderStep: ProgressOrderInfo.orderConfirmation,
              isScanAndGoOrderProgress:
                  purchaseMethod == PurchaseMethod.scanAndGo,
            ),
            const BasketItemOrdersList(),
            _SubTotal(
              discountValue: _viewModel.discountAmount,
              fee: _viewModel.estimatedDeliveryPrice,
              totalPayment: _viewModel.totalPrice,
              provisionalTotalPrice: _viewModel.provisionalTotalPrice,
            ),
            Divider(
              thickness: 1.h,
              height: 0.h,
              color: ColorUtils.divider,
            ),
            _InfomationOrders(
              purchaseMethod: purchaseMethod,
            ),
          ],
        );
      }),
      bottomNavigationBar: ButtonBottom(
        onPressed: () {
          if (purchaseMethod == PurchaseMethod.scanAndGo) {
            Get.toNamed(MyRouter.directPaymentMethod);
          } else if (purchaseMethod == PurchaseMethod.onlineShopping) {
            Get.toNamed(MyRouter.orderInfoStep3);
          }
        },
        title: Strings.lblGoNext.tr,
      ),
    );
  }
}
