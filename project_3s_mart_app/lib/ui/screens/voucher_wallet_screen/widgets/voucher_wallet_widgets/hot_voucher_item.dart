import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';

class HotVoucherItem extends StatelessWidget {
  final String name;
  final String brand;
  final double unitPrice;
  final String imageUrl;
  final double unitPriceAfterDiscount;
  final VoidCallback onPressed;

  const HotVoucherItem({
    Key? key,
    required this.name,
    required this.brand,
    required this.unitPrice,
    required this.imageUrl,
    required this.unitPriceAfterDiscount,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 9.h, 0, 7.h),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(16.w, 0, 8.w, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/voucher_header.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 76.h,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(7.w, 0, 12.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      brand,
                      style: TextStyleUtils.desciption.copyWith(
                        color: ColorUtils.black86,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 4.h, 0, 8.h),
                      child: Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleUtils.footnoteSemiBold.copyWith(
                          color: ColorUtils.black86,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          CurrencyUtils.formatCurrency(unitPriceAfterDiscount),
                          style: TextStyleUtils.footnoteSemiBold.copyWith(
                            color: ColorUtils.primaryRedColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                          child: Text(
                            CurrencyUtils.formatCurrency(unitPrice),
                            style: TextStyleUtils.priceTag.copyWith(
                              color: ColorUtils.black86,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
