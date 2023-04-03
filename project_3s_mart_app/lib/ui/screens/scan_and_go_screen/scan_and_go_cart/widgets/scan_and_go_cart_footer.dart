import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ScanAndGoCartFooter extends StatelessWidget {
  const ScanAndGoCartFooter({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 0.5.h,
            height: 0.h,
            color: ColorUtils.divider,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 16.w,
              left: 16.w,
              top: 16.h,
              bottom: 24.h,
            ),
            child: Consumer<IBasketViewModel>(
              builder: (_, vm, __) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  vm.isBasketNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Strings.totalPayment.tr,
                                style: TextStyleUtils.body),
                            Text(
                              CurrencyUtils.formatCurrency(
                                  vm.provisionalTotalPrice),
                              style: TextStyleUtils.largeHeading.copyWith(
                                color: ColorUtils.primaryRedColor,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  SizedBox(height: 16.h),
                  CustomButton(
                    onPressed: vm.isBasketNotEmpty
                        ? () {
                            onPressed();
                          }
                        : null,
                    child: Text(
                      title,
                      style:
                          TextStyleUtils.button.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
