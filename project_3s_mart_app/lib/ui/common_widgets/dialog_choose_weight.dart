import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/add_cart_anim/add_cart_anim_on_press_widget.dart';
import 'package:project_3s_mart_app/ui/common_widgets/quantity_group_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/common_widgets/weight_item.dart';
import 'package:provider/provider.dart';
import 'custom_button.dart';

class DiaLogChooseWeight extends StatefulWidget {
  final ProductUIModel product;

  const DiaLogChooseWeight({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DiaLogChooseWeight> createState() => _DiaLogChooseWeightState();

  static Future<void> show(ProductUIModel product) async {
    await Get.dialog(DiaLogChooseWeight(product: product));
  }
}

class _DiaLogChooseWeightState extends State<DiaLogChooseWeight> {
  int quantity = 1;
  late IBasketViewModel _vm;
  @override
  void initState() {
    _vm = context.read<IBasketViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(10.r),
      titlePadding: EdgeInsets.only(top: 16.h, left: 16),
      title: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: RippleClickEffect(
              onPressed: () {
                Get.back();
              },
              child: const Icon(Icons.close),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              Strings.chooseWeight.tr,
              style: TextStyleUtils.body.copyWith(
                color: ColorUtils.black86,
              ),
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.all(0.r),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            thickness: 1,
            color: ColorUtils.divider,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 6.h,
              right: 16.w,
              left: 16.w,
              bottom: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      widget.product.imageUrl,
                      width: 100.w,
                      height: 100.h,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: TextStyleUtils.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Text(
                                '${CurrencyUtils.format.format(widget.product.unitPriceAfterDiscount)}đ',
                                style: TextStyleUtils.bodyStrong.copyWith(
                                  color: ColorUtils.primaryRedColor,
                                ),
                              ),
                              Text(
                                '-${widget.product.discount}%',
                                style: TextStyleUtils.footnote.copyWith(
                                  color: ColorUtils.black60,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '${Strings.originalPrice.tr}: ${CurrencyUtils.format.format(widget.product.unitPrice)}đ',
                            style: TextStyleUtils.originalPrice.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black60,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Text(
                      Strings.weight.tr,
                      style: TextStyleUtils.body,
                    ),
                    Expanded(
                      child: Wrap(
                        runSpacing: 6.h,
                        children: List.generate(
                          listWeights.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Selector<IBasketViewModel, int>(
                                selector: (_, _vm) => _vm.selectWeight,
                                builder: (_, _value, __) {
                                  return WeightItem(
                                    active: _value == index,
                                    onPressed: () {
                                      _vm.selectWeight = index;
                                    },
                                    weight: listWeights[index],
                                  );
                                }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Text(
                      Strings.quantity.tr,
                      style: TextStyleUtils.body,
                    ),
                    SizedBox(width: 20.w),
                    QuantityGroupButton(
                      currentValue: quantity,
                      onDecrease: quantity > 1
                          ? () {
                              quantity--;
                              setState(() {});
                            }
                          : null,
                      onIncrease: () {
                        quantity++;
                        setState(() {});
                      },
                      product: widget.product,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Consumer<IBasketViewModel>(builder: (_, _viewModel, __) {
                  return AddCartAnimOnPressedWidget(
                    product: widget.product,
                    child: CustomButton(
                      onPressed: () {
                        _viewModel.addBasketItem(widget.product,
                            quantity: quantity);
                        Get.back();
                      },
                      height: 44.h,
                      minWidth: 343.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/shopping_cart.svg'),
                          SizedBox(width: 5.w),
                          Text(
                            Strings.addToBasket.tr,
                            style: TextStyleUtils.button.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
