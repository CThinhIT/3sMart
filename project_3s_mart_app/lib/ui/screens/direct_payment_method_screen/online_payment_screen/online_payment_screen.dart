import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button_with_border.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/widgets/progress_order_info_widget.dart';
import 'package:provider/provider.dart';

class OnlinePaymentScreen extends StatelessWidget {
  const OnlinePaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewmodel = context.read<IOrderInfoViewModel>();
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.paymentMethods.tr,
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
              child: Selector<IOrderInfoViewModel, PaymentMethod>(
                  selector: (_, _viewmodel) => _viewmodel.paymentMethod,
                  builder: (_, value, __) {
                    return Column(
                      children: [
                        ButtonBorderWithDot(
                          active: value == PaymentMethod.visaCardOrMastercard,
                          onPressed: () {
                            viewmodel.paymentMethod =
                                PaymentMethod.visaCardOrMastercard;
                          },
                          name: Strings.visaCard.tr,
                          image: 'assets/images/visa.png',
                          btnHeight: 56.h,
                        ),
                        SizedBox(height: 16.h),
                        ButtonBorderWithDot(
                          active: value == PaymentMethod.domesticATMCard,
                          onPressed: () {
                            viewmodel.paymentMethod =
                                PaymentMethod.domesticATMCard;
                          },
                          name: Strings.domesticATMCard.tr,
                          image: 'assets/images/credit-card.png',
                          btnHeight: 56.h,
                        ),
                        SizedBox(height: 16.h),
                        ButtonBorderWithDot(
                          active: value == PaymentMethod.momoEWallet,
                          onPressed: () {
                            viewmodel.paymentMethod = PaymentMethod.momoEWallet;
                          },
                          name: Strings.momoEWallet.tr,
                          image: 'assets/images/momo.png',
                          btnHeight: 56.h,
                        ),
                        const Spacer(),
                        CustomButton(
                          onPressed: () {
                            Get.toNamed(
                              MyRouter.scanAndGoBarCode,
                              arguments: "09128492",
                            );
                          },
                          child: Text(
                            Strings.completed.tr,
                            style: TextStyleUtils.body.copyWith(
                              color: ColorUtils.white,
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
