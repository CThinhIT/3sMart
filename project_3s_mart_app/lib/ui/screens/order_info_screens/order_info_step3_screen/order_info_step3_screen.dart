import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/button_bottom.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button_with_border.dart';
import 'package:project_3s_mart_app/ui/screens/order_info_screens/widgets/progress_order_info_widget.dart';
import 'package:provider/provider.dart';

class OrderInfoStep3Screen extends StatefulWidget {
  const OrderInfoStep3Screen({Key? key}) : super(key: key);

  @override
  _OrderInfoStep3ScreenState createState() => _OrderInfoStep3ScreenState();
}

class _OrderInfoStep3ScreenState extends State<OrderInfoStep3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.payment.tr,
        ),
      ),
      body: Column(
        children: [
          const ProgressOrderInfoWidget(
            currentOrderStep: ProgressOrderInfo.payment,
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: const [
                _BuildPaymentMethodButton(
                    image: 'assets/images/visa.png',
                    paymentMethod: PaymentMethod.visaCardOrMastercard),
                _BuildPaymentMethodButton(
                    image: 'assets/images/credit-card.png',
                    paymentMethod: PaymentMethod.domesticATMCard),
                _BuildPaymentMethodButton(
                    image: 'assets/images/momo.png',
                    paymentMethod: PaymentMethod.momoEWallet),
                _BuildPaymentMethodButton(
                    image: 'assets/images/vnd.png',
                    paymentMethod: PaymentMethod.cOD),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonBottom(
        onPressed: () {
          Get.toNamed(MyRouter.orderInfoStep4);
        },
        title: Strings.payment.tr,
      ),
    );
  }
}

class _BuildPaymentMethodButton extends StatelessWidget {
  final String image;
  final PaymentMethod paymentMethod;
  const _BuildPaymentMethodButton({
    Key? key,
    required this.image,
    required this.paymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewmodel = context.read<IOrderInfoViewModel>();
    return Selector<IOrderInfoViewModel, PaymentMethod>(
      selector: (_, __) => viewmodel.paymentMethod,
      builder: (_, __, ___) {
        bool active = viewmodel.paymentMethod == paymentMethod;
        return Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: ButtonBorderWithDot(
            active: active,
            image: image,
            name: EnumHelper.getDescription(
              EnumMap.paymentMethod,
              paymentMethod,
            ),
            onPressed: () {
              viewmodel.paymentMethod = paymentMethod;
            },
          ),
        );
      },
    );
  }
}
