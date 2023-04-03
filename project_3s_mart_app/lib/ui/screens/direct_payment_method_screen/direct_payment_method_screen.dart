import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/button_bottom.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button_with_border.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/widgets/progress_order_info_widget.dart';
import 'package:provider/provider.dart';

class DirectPaymentMethodScreen extends StatelessWidget {
  const DirectPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewmodel = context.read<IOrderInfoViewModel>();
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.orderDetails.tr,
        ),
      ),
      body: Column(
        children: [
          const ProgressOrderInfoWidget(
            currentOrderStep: ProgressOrderInfo.payment,
            isScanAndGoOrderProgress: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Selector<IOrderInfoViewModel, DirectPaymentMethod?>(
                selector: (_, _viewmodel) => _viewmodel.directPaymentMethod,
                builder: (_, value, __) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ButtonBorderWithDot(
                              active: value == DirectPaymentMethod.kiosPayment,
                              onPressed: () {
                                viewmodel.directPaymentMethod =
                                    DirectPaymentMethod.kiosPayment;
                              },
                              name: Strings.kiosPayment.tr,
                              image: 'assets/images/kios_payment.png',
                              btnHeight: 56.h,
                            ),
                            SizedBox(height: 16.h),
                            ButtonBorderWithDot(
                              active:
                                  DirectPaymentMethod.counterPayment == value,
                              onPressed: () {
                                viewmodel.directPaymentMethod =
                                    DirectPaymentMethod.counterPayment;
                              },
                              name: Strings.counterPayment.tr,
                              image: 'assets/images/counter_payment.png',
                              btnHeight: 56.h,
                            ),
                            SizedBox(height: 16.h),
                            ButtonBorderWithDot(
                              active:
                                  DirectPaymentMethod.onlinePayment == value,
                              onPressed: () {
                                viewmodel.directPaymentMethod =
                                    DirectPaymentMethod.onlinePayment;
                                Get.toNamed(MyRouter.onlinePayment);
                              },
                              name: Strings.onlinePayment.tr,
                              image: 'assets/images/online_payment.png',
                              btnHeight: 56.h,
                              dot: const Icon(
                                Icons.navigate_next,
                                color: ColorUtils.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonBottom(
        onPressed: () {
          if (viewmodel.directPaymentMethod ==
              DirectPaymentMethod.kiosPayment) {
            Get.offNamedUntil(
              MyRouter.scanAndGoBarCode,
              (route) => route.settings.name == MyRouter.selectPurchaseMethod,
              arguments: "09128492",
            );
          }
        },
        title: Strings.completed.tr,
      ),
    );
  }
}
