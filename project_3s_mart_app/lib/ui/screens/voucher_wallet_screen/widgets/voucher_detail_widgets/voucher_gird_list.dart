import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/voucher_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/screens/voucher_wallet_screen/widgets/voucher_detail_widgets/voucher_gird_item.dart';

class VoucherGridList extends StatelessWidget {
  final List<VoucherUIModel> vouchers;
  const VoucherGridList({Key? key, required this.vouchers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.maybeYouLikeIt.tr,
                style: TextStyleUtils.button.copyWith(
                  color: ColorUtils.black86,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(
                    MyRouter.voucherWallet,
                    arguments: 1,
                  );
                },
                child: Text(
                  Strings.viewAll.tr,
                  style: TextStyleUtils.buttonBold.copyWith(
                    color: ColorUtils.primaryRedColor,
                  ),
                ),
              ),
            ],
          ),
          GridView(
            //physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.1),
            children: List.generate(
              2,
              (index) {
                if (vouchers[index] != null) {
                  return VoucherGirdItem(
                    voucher: vouchers[index],
                    onTap: () {
                      Get.toNamed(
                        MyRouter.voucherDetail,
                        arguments: vouchers[index],
                        preventDuplicates: false,
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
