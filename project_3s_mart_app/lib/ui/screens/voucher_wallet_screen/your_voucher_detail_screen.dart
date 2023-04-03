import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/voucher_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/date_time_extension.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/button_bottom.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';

import 'widgets/voucher_detail_widgets/branch_card_widget.dart';
import 'widgets/voucher_detail_widgets/voucher_detail_widget.dart';

class YourVoucherDetailScreen extends StatelessWidget {
  final VoucherUIModel voucher;
  const YourVoucherDetailScreen({
    Key? key,
    required this.voucher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.voucherDetails.tr,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              height: 150.h,
              //color: Colors.red,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/voucher_header.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        voucher.name,
                        style: TextStyleUtils.largeHeading2.copyWith(
                          color: ColorUtils.black86,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Text(
                          "${Strings.expiryDate.tr}${voucher.date.toDateString()}",
                          style: TextStyleUtils.body.copyWith(
                            color: ColorUtils.black86,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                  color: ColorUtils.black40,
                ),
                VoucherDetail(
                  detail: voucher.detail,
                ),
                const Divider(
                  height: 1,
                  color: ColorUtils.black40,
                ),
                BranchCard(
                  imageUrl: "",
                  name: voucher.brand,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonBottom(
        onPressed: () {
          Get.toNamed(MyRouter.voucherBarCode, arguments: voucher.code);
        },
        title: Strings.useVoucher.tr,
        hint: Strings.storePurchasesOnly.tr,
      ),
    );
  }
}
