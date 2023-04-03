import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';
import 'package:project_3s_mart_app/core/ui_models/basket_item_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:provider/provider.dart';

class BasketItemOrdersList extends StatelessWidget {
  const BasketItemOrdersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IBasketViewModel>(builder: (_, _viewModel, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: Text(
              Strings.products.tr + ' (${_viewModel.basketQuantity}):',
              style: TextStyleUtils.subHeading.copyWith(
                color: ColorUtils.black60,
              ),
            ),
          ),
          const DottedLine(
            dashColor: Color(0xFFEBEBEB),
            lineThickness: 1,
          ),
          ListView.builder(
            itemCount: _viewModel.basketItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _BasketOrderItem(
              basketItemUIModel: _viewModel.basketItems[index],
              index: index + 1,
            ),
          ),
          SizedBox(height: 12.h),
          Divider(
            thickness: 1.h,
            color: ColorUtils.divider,
            height: 0.h,
          ),
        ],
      );
    });
  }
}

class _BasketOrderItem extends StatelessWidget {
  const _BasketOrderItem({
    Key? key,
    required this.basketItemUIModel,
    required this.index,
  }) : super(key: key);

  final BasketItemUIModel basketItemUIModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("00");
    final String unitType = EnumHelper.getDescription(
      EnumMap.productUnitType,
      basketItemUIModel.product.unitType,
    );
    return Padding(
      padding: EdgeInsets.only(
        top: 12.h,
        left: 16.w,
        right: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${formatter.format(index)}. ${basketItemUIModel.product.name}',
            style: TextStyleUtils.body.copyWith(
              color: ColorUtils.black86,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 85.w,
                child: Text(
                  '${basketItemUIModel.quantity} ($unitType)',
                  style: TextStyleUtils.body.copyWith(
                    color: ColorUtils.black60,
                  ),
                ),
              ),
              Text(
                'X',
                style: TextStyleUtils.body.copyWith(
                  color: ColorUtils.black60,
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                CurrencyUtils.formatCurrency(
                    basketItemUIModel.product.unitPriceAfterDiscount),
                style: TextStyleUtils.body.copyWith(
                  color: ColorUtils.black60,
                ),
              ),
              const Spacer(),
              Text(
                CurrencyUtils.formatCurrency(
                    basketItemUIModel.product.unitPriceAfterDiscount *
                        basketItemUIModel.quantity),
                style: TextStyleUtils.body.copyWith(
                  color: ColorUtils.black86,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
