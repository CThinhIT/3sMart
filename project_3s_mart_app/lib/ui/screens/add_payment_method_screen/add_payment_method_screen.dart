import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.addPaymentInformation.tr,
        ),
      ),
      backgroundColor: ColorUtils.backgroundColor,
      body: Column(
        children: [
          _CardPaymentItem(
            image: 'assets/images/ic_credit_card.png',
            name: Strings.addCreditDebitCard.tr,
            onPressed: () {
              Get.toNamed(MyRouter.addCreditCard);
            },
          ),
          SizedBox(height: 12.h),
          _CardPaymentItem(
            image: 'assets/images/momo.png',
            name: Strings.linkMomoEWallet.tr,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _CardPaymentItem extends StatelessWidget {
  const _CardPaymentItem({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.image,
  }) : super(key: key);

  final String name;
  final VoidCallback onPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: RippleClickEffect(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 16.w,
          ),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 44.w,
                width: 44.w,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 12.w),
              Text(
                name,
                style: TextStyleUtils.body,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
