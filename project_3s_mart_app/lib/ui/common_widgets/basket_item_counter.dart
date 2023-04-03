import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/ui_models/basket_item_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/ui/common_widgets/add_cart_anim/add_cart_anim_on_press_widget.dart';
import 'package:project_3s_mart_app/ui/common_widgets/border_widget.dart';
import 'package:project_3s_mart_app/ui/common_widgets/product/product_item.dart';
import 'package:project_3s_mart_app/ui/utils/add_cart_anim_utils.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class BasketItemCounter extends StatelessWidget {
  final BasketItemUIModel basketItem;
  final double size;
  final int minQuantity;

  // ignore: use_key_in_widget_constructors
  BasketItemCounter({
    required this.basketItem,
    this.minQuantity = 1,
    double? size,
  }) : size = size ?? 32.r;

  @override
  Widget build(BuildContext context) {
    var basketVm = context.read<IBasketViewModel>();
    return BorderWidget(
      borderRadius: BorderRadius.circular(2.r),
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: AddCartAnimOnPressedWidget(
                reverseAnim: true,
                product: basketItem.product,
                child: IconButton(
                  icon: Icon(
                    Icons.remove,
                    size: 20.r,
                    color: basketItem.quantity > minQuantity
                        ? ColorUtils.black86
                        : ColorUtils.black40,
                  ),
                  onPressed: basketItem.quantity > minQuantity
                      ? () {
                          basketVm.addQuantity(basketItem.product.id, -1);
                        }
                      : null,
                  padding: const EdgeInsets.all(0),
                  splashRadius: 24.r,
                ),
              ),
            ),
            BorderWidget(
              child: Container(
                height: size,
                constraints: BoxConstraints(minWidth: size),
                alignment: Alignment.center,
                child: Text(
                  basketItem.quantity.toString(),
                  style: TextStyleUtils.button,
                ),
              ),
              border: const Border(
                left: BorderSide(color: ColorUtils.black86),
                right: BorderSide(color: ColorUtils.black86),
              ),
            ),
            SizedBox(
              width: size,
              height: size,
              child: AddCartAnimOnPressedWidget(
                product: basketItem.product,
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 20.r,
                    color: ColorUtils.black86,
                  ),
                  onPressed: () {
                    basketVm.addQuantity(basketItem.product.id, 1);
                  },
                  padding: const EdgeInsets.all(0),
                  splashRadius: 24.r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
