import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/ui_models/voucher_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';

class VoucherGirdItem extends StatelessWidget {
  final VoucherUIModel voucher;
  final Function onTap;
  const VoucherGirdItem({Key? key, required this.voucher, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Card(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              height: 70.h,
              //color: Colors.red,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/voucher_header.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Image.asset("assets/images/voucher_wallet.png"),
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 4.h, 5.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    voucher.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleUtils.footnoteSemiBold.copyWith(
                      color: ColorUtils.black86,
                    ),
                  ),
                  Text(
                    voucher.brand,
                    style: TextStyleUtils.desciption.copyWith(
                      color: ColorUtils.black60,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          CurrencyUtils.formatCurrency(
                              voucher.unitPriceAfterDiscount),
                          style: TextStyleUtils.productType.copyWith(
                            color: ColorUtils.primaryRedColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                          child: Text(
                            CurrencyUtils.formatCurrency(voucher.unitPrice),
                            style: TextStyleUtils.originalPrice.copyWith(
                              color: ColorUtils.black86,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
