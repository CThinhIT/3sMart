import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/ui/utils/add_cart_anim_utils.dart';

import '../product/product_item.dart';

/// Widget that shows add cart anim on pressed
/// 
/// Note: before using this widget in a screen, you must attach global keys 
/// in the screen to keys in [AddCartAnimmUtils]. Check [AddCartAnimmUtils] for more details
/// 
// ignore: must_be_immutable
class AddCartAnimOnPressedWidget extends StatelessWidget {
  final ProductUIModel product;
  final Widget child;
  final bool reverseAnim;
  final bool enabled;
  final GlobalKey? screenKey;
  final Offset? endPosition;
  late Offset pressPosition;

  AddCartAnimOnPressedWidget({
    Key? key,
    required this.product,
    required this.child,
    this.reverseAnim = false,
    this.enabled = true,
    this.screenKey,
    this.endPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) {
        pressPosition = details.globalPosition;
      },
      onPanCancel: () {
        if (enabled) {
          if (screenKey == null) {
            AddCartAnimUtils.animateFrom(
              animatedWidget: SizedBox(
                width: 24.r,
                height: 24.r,
                child: ProductImageWidget(product: product),
              ),
              reverse: reverseAnim,
              startPosition: pressPosition,
            );
          } else {
            AddCartAnimUtils.animateFromTo(
              animatedWidget: SizedBox(
                width: 24.r,
                height: 24.r,
                child: ProductImageWidget(product: product),
              ),
              startPosition: pressPosition,
              endPosition: endPosition!,
              screenKey: screenKey!,
              reverse: reverseAnim,
            );
          }
        }
      },
      child: child,
    );
  }
}
