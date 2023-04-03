import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/payment_account_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ipayment_account.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/more_bottom_sheet.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:provider/provider.dart';

class PaymentSettingScreen extends StatelessWidget {
  const PaymentSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.paymentSetting.tr,
        ),
      ),
      backgroundColor: ColorUtils.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.r),
            child: Text(
              Strings.paymentAccount.tr,
              style: TextStyleUtils.title,
            ),
          ),
          Consumer<IPaymentAccountViewModel>(
            builder: (_, _viewModel, __) => Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) =>
                    index != _viewModel.paymentAccounts.length
                        ? _CardItem(
                            paymentAccount: _viewModel.paymentAccounts[index],
                            onPressed: () {},
                          )
                        : _CardItem(
                            onPressed: () {
                              Get.toNamed(MyRouter.addPaymentInformation);
                            },
                          ),
                itemCount: _viewModel.paymentAccounts.length + 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({
    Key? key,
    this.paymentAccount,
    required this.onPressed,
  }) : super(key: key);

  final PaymentAccountUIModel? paymentAccount;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final String image = paymentAccount == null
        ? 'assets/images/ic_add.png'
        : paymentAccount?.paymentMethod == PaymentMethod.momoEWallet
            ? 'assets/images/ic_momo.png'
            : paymentAccount?.paymentMethod ==
                    PaymentMethod.visaCardOrMastercard
                ? 'assets/images/ic_visa.png'
                : 'assets/images/ic_add.png';
    IPaymentAccountViewModel _viewModel =
        context.read<IPaymentAccountViewModel>();
    return Selector<IPaymentAccountViewModel, PaymentAccountUIModel?>(
        selector: (_, _vm) => _vm.paymentAccount,
        builder: (_, _value, __) {
          return Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 8.h),
            child: RippleClickEffect(
              onPressed: onPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12.h,
                  horizontal: 16.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          image,
                          height: 44.w,
                          width: 44.w,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                paymentAccount != null
                                    ? paymentAccount!.cardName
                                    : Strings.addCardAccount.tr,
                                style: TextStyleUtils.body,
                                overflow: TextOverflow.ellipsis,
                              ),
                              paymentAccount != null
                                  ? Text(
                                      paymentAccount!.cardNo,
                                      style: TextStyleUtils.footnote,
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        paymentAccount != null
                            ? IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => MoreBodyBottomSheet(
                                      textItem1: _viewModel.paymentAccount !=
                                              paymentAccount
                                          ? Strings.setAsDefault.tr
                                          : Strings.removeDefaultAccount.tr,
                                      onPressItem1: () {
                                        _viewModel.paymentAccount !=
                                                paymentAccount
                                            ? _viewModel.paymentAccount =
                                                paymentAccount
                                            : _viewModel.paymentAccount = null;
                                        Get.back();
                                      },
                                      onPressItem2: () {
                                        _viewModel.deletePaymentAccount(
                                            paymentAccount!);
                                        Get.back();
                                      },
                                      textItem2: Strings.removeAccount.tr,
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.more_horiz,
                                  size: 30.r,
                                  color:
                                      const Color(0xFF09121F).withOpacity(0.6),
                                ),
                              )
                            : Icon(
                                Icons.navigate_next,
                                size: 30.r,
                                color: const Color(0xFF09121F).withOpacity(0.6),
                              ),
                      ],
                    ),
                    paymentAccount != null &&
                            paymentAccount == _viewModel.paymentAccount
                        ? Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/online_payment.png',
                                  color: ColorUtils.green,
                                  height: 14.h,
                                  width: 16.w,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  Strings.defaultAccount.tr,
                                  style: TextStyleUtils.body.copyWith(
                                    color: ColorUtils.green,
                                  ),
                                )
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
