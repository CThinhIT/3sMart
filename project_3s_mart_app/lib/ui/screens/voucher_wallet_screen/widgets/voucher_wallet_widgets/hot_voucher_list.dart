import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/ui_models/voucher_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/ui/screens/voucher_wallet_screen/widgets/voucher_wallet_widgets/hot_voucher_item.dart';

class HotVoucherList extends StatelessWidget {
  final List<VoucherUIModel> vouchers;
  const HotVoucherList({Key? key, required this.vouchers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (_, __) => Divider(
              height: 1.h,
              thickness: 1.h,
              color: ColorUtils.divider,
            ),
            itemCount: vouchers.length,
            itemBuilder: (context, index) {
              final VoucherUIModel voucher = vouchers[index];
              return HotVoucherItem(
                name: voucher.name,
                brand: voucher.brand,
                imageUrl: voucher.imageUrl,
                unitPrice: voucher.unitPrice,
                unitPriceAfterDiscount: voucher.unitPriceAfterDiscount,
                onPressed: () {
                  Get.toNamed(
                    MyRouter.voucherDetail,
                    arguments: voucher,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
