import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/voucher_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/button_bottom.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button_with_border.dart';
import 'package:provider/provider.dart';

class VoucherPaymentScreen extends StatefulWidget {
  const VoucherPaymentScreen({Key? key, required this.voucher})
      : super(key: key);
  final VoucherUIModel voucher;
  @override
  _VoucherPaymentScreenState createState() => _VoucherPaymentScreenState();
}

class _VoucherPaymentScreenState extends State<VoucherPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: "Voucher-${widget.voucher.code}",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Text(
              widget.voucher.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleUtils.subHeadingRegular.copyWith(
                color: ColorUtils.black86,
              ),
            ),
          ),
          Divider(
            height: 4.h,
            thickness: 4.h,
            color: ColorUtils.divider,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
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
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonBottom(
        onPressed: () {},
        title: Strings.getVoucher.tr,
        hint: Strings.storePurchasesOnly.tr,
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
    var viewModel = context.read<IOrderInfoViewModel>();
    return Selector<IOrderInfoViewModel, PaymentMethod>(
      selector: (_, __) => viewModel.paymentMethod,
      builder: (_, __, ___) {
        bool active = viewModel.paymentMethod == paymentMethod;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: ButtonBorderWithDot(
            btnHeight: 56.h,
            active: active,
            onPressed: () {
              viewModel.paymentMethod = paymentMethod;
            },
            image: image,
            name:
                EnumHelper.getDescription(EnumMap.paymentMethod, paymentMethod),
          ),
        );
      },
    );
  }
}
