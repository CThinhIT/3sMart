import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/ui/common_widgets/add_cart_anim/add_cart_anim_overlay_widget.dart';

/// Util class to show add to cart animation
///
/// Call [animateFrom] to show add to cart animation
///
/// Note: [homeScreenKey], [homeShoppingCartBtnKey], ... should attach to the corresponding widgets
/// before calling [animateFrom]
class AddCartAnimUtils {
  /// GloabalKey attaching to the root widget of [HomeScreen]
  static final homeScreenKey = GlobalKey();

  /// GloabalKey attaching to the shopping cart btn of [HomeScreen]
  static final homeShoppingCartBtnKey = GlobalKey();

  /// GloabalKey attaching to the root widget of [SearchProductScreen]
  static final productCategoryScreenKey = GlobalKey();

  /// GloabalKey attaching to the shopping cart btn of [SearchProductScreen]
  static final productCategoryShoppingCartBtnKey = GlobalKey();

  /// GloabalKey attaching to the root widget of [ProductDetailScreen]
  static final productDetailScreenKey = GlobalKey();

  /// GloabalKey attaching to the basket btn of [ProductDetailScreen]
  static final productDetailBasketBtnKey = GlobalKey();

  /// GloabalKey attaching to the root widget of [ScanScreen]
  static final scanScreenKey = GlobalKey();

  /// GloabalKey attaching to the basket btn of [ScanScreen]
  static final scanBasketBtnKey = GlobalKey();

  /// Map to get corresponding screen key, shopping cart btn key by current route
  static final routeToGlobalKeyMap = {
    MyRouter.home: homeScreenKey,
    MyRouter.home + 'btn': homeShoppingCartBtnKey,
    MyRouter.productCategory: productCategoryScreenKey,
    MyRouter.productCategory + 'btn': productCategoryShoppingCartBtnKey,
    MyRouter.productDetail: productDetailScreenKey,
    MyRouter.productDetail + 'btn': productDetailBasketBtnKey,
    MyRouter.scan: scanScreenKey,
    MyRouter.scan + 'btn': scanBasketBtnKey,
  };

  /// Containing widget to animate
  static OverlayEntry? overlayEntry;

  /// Show add to cart animation from [startPosition], endPosition will be determined
  /// by getting postion from [homeShoppingCartBtnKey] or [searchProductShoppingCartBtnKey]
  ///
  /// param `[animatedWidget] is a widget that will be animated
  /// param `[reverse] = false then animation will start from [startPosition] to endPosition
  /// Otherwise animation will start from endPosition to [startPosition]
  static animateFrom({
    required Widget animatedWidget,
    required Offset startPosition,
    bool reverse = false,
  }) {
    var screenKey = routeToGlobalKeyMap[Get.currentRoute];
    if (screenKey != null) {
      var shoppingCartBtnKey = routeToGlobalKeyMap[Get.currentRoute + 'btn'];
      var shoppingCartBtnRenderBox =
          (shoppingCartBtnKey!.currentContext!.findRenderObject() as RenderBox);
      var endPosition = shoppingCartBtnRenderBox.localToGlobal(Offset.zero);

      animateFromTo(
        screenKey: screenKey,
        animatedWidget: animatedWidget,
        startPosition: startPosition,
        endPosition: endPosition,
        reverse: reverse,
      );
    }
  }

  /// Show add to cart animation from [startPosition] to [endPosition]
  ///
  /// param `[animatedWidget] is a widget that will be animated
  /// param `[screenKey] is a global key of root widget in screens that need add cart animtion
  /// param `[reverse] = false then animation will start from [startPosition] to endPosition
  /// Otherwise animation will start from endPosition to [startPosition]
  static animateFromTo({
    required GlobalKey screenKey,
    required Widget animatedWidget,
    required Offset startPosition,
    required Offset endPosition,
    bool reverse = false,
  }) {
    overlayEntry?.remove();
    overlayEntry = _createAddCartAnimOverlayEntry(
      screenKey: screenKey,
      startPosition: reverse ? endPosition : startPosition,
      endPosition: reverse ? startPosition : endPosition,
      animatedWidget: animatedWidget,
    );
    Overlay.of(screenKey.currentContext!)?.insert(overlayEntry!);
  }

  static OverlayEntry _createAddCartAnimOverlayEntry({
    required GlobalKey screenKey,
    required Offset startPosition,
    required Offset endPosition,
    required Widget animatedWidget,
  }) {
    return OverlayEntry(builder: (context) {
      return AddCartAnimOverlayWidget(
        screenKey: screenKey,
        startPosition: startPosition,
        endPosition: endPosition,
        child: animatedWidget,
        animationStatusCallback: (status) {
          if (status == AnimationStatus.completed) {
            overlayEntry?.remove();
            overlayEntry = null;
          }
        },
      );
    });
  }
}
