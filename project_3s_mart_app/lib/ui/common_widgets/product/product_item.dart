import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/basket_item_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/add_cart_anim/add_cart_anim_on_press_widget.dart';
import 'package:project_3s_mart_app/ui/common_widgets/basket_item_counter.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final ProductUIModel product;
  final bool showDiscountPercents;
  final bool carousel;

  // ignore: use_key_in_widget_constructors
  const ProductItem({
    required this.product,
    this.showDiscountPercents = true,
    this.carousel = false,
  });

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      onPressed: () {
        (Get.currentRoute == MyRouter.productDetail)
            ? Get.offNamed(
                MyRouter.productDetail,
                arguments: product,
                preventDuplicates: false,
              )
            : Get.toNamed(
                MyRouter.productDetail,
                arguments: product,
                preventDuplicates: false,
              );
      },
      borderRadius: BorderRadius.circular(product.isGramUnit ? 8.r : 4.r),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorUtils.greyLight,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 8.h,
            ),
            width: carousel ? 135.w : 104.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductImageWidget(
                  product: product,
                  size: carousel ? 122.r : 93.r,
                ),
                SizedBox(height: 4.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 36.h,
                      child: ProductNameWidget(product: product),
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      height: 46.h,
                      child: ProductUnitAndPriceWidget(
                        product: product,
                        showDiscountPercents: showDiscountPercents,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 25.h,
                      child: AddToBasketButton(
                        product: product,
                        height: 24.h,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          if (product.discount > 0)
            SizedBox(
              height: 34.h,
              width: 34.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_discount.svg',
                    height: 34.h,
                    width: 34.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Text(
                      "-${product.discount}%",
                      style: TextStyleUtils.productType.copyWith(
                        color: ColorUtils.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class ProductImageWidget extends StatelessWidget {
  final Color backgroundColor;
  // ignore: use_key_in_widget_constructors
  const ProductImageWidget({
    required this.product,
    this.backgroundColor = ColorUtils.grey,
    this.size,
  });

  final ProductUIModel product;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
            /// TODO: Remove demo asset image
            image: (product.imageUrl.contains('http')
                ? CachedNetworkImageProvider(product.imageUrl)
                : AssetImage(product.imageUrl)) as ImageProvider<Object>,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ProductNameWidget extends StatelessWidget {
  final ProductUIModel product;
  const ProductNameWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      product.name,
      maxLines: 2,
      style: TextStyleUtils.productType.copyWith(color: ColorUtils.black),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ProductUnitAndPriceWidget extends StatelessWidget {
  final bool showDiscountPercents;
  final bool showOriginPrice;

  const ProductUnitAndPriceWidget({
    Key? key,
    required this.product,
    required this.showDiscountPercents,
    this.showOriginPrice = true,
  }) : super(key: key);

  final ProductUIModel product;

  @override
  Widget build(BuildContext context) {
    final String unitType = EnumHelper.getDescription(
      EnumMap.productUnitType,
      product.unitType,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          unitType,
          style: TextStyleUtils.footnoteSemiBold.copyWith(
            color: ColorUtils.black60,
          ),
        ),
        SizedBox(height: 4.h),
        Text.rich(
          TextSpan(
              text:
                  '${CurrencyUtils.formatCurrency(product.unitPriceAfterDiscount)} ',
              style: TextStyleUtils.footnoteBold.copyWith(
                color: ColorUtils.primaryRedColor,
              ),
              children: [
                if (showOriginPrice &&
                    product.unitPrice > product.unitPriceAfterDiscount)
                  TextSpan(
                    text: CurrencyUtils.formatCurrency(product.unitPrice),
                    style: TextStyleUtils.priceTag.copyWith(
                      color: ColorUtils.black60,
                    ),
                  )
              ]),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  final ProductUIModel product;
  final bool expandWidth;
  final double? height;
  final bool center;

  // ignore: use_key_in_widget_constructors
  const AddToBasketButton({
    required this.product,
    this.expandWidth = true,
    this.height,
    this.center = true,
  });

  @override
  Widget build(BuildContext context) {
    var quantityInBasket = context.select<IBasketViewModel, int>(
      (vm) => vm.getBasketItemQuantity(product.id),
    );
    return quantityInBasket == 0
        ? AddCartAnimOnPressedWidget(
            product: product,
            enabled: !product.isGramUnit,
            child: RippleClickEffect(
              onPressed: () {
                var vm = context.read<IBasketViewModel>();
                vm.addBasketItem(product);
              },
              child: Container(
                alignment: Alignment.centerRight,
                width: expandWidth ? double.infinity : null,
                height: height,
                padding: EdgeInsets.symmetric(
                  vertical: 6.h,
                  horizontal: product.isGramUnit ? 4.w : 8.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: ColorUtils.primaryRedColor,
                ),
                child: Center(
                  child: Text(
                    Strings.add.tr,
                    textAlign: TextAlign.center,
                    style: TextStyleUtils.footnoteSemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!center)
                const Expanded(
                  child: SizedBox.shrink(),
                ),
              Center(
                child: BasketItemCounter(
                  basketItem: getBasketItem(context),
                  size: 24.r,
                  minQuantity:
                      0, // can remove product in basket by decreasing quantity to 0
                ),
              ),
            ],
          );
  }

  BasketItemUIModel getBasketItem(BuildContext context) {
    return context.read<IBasketViewModel>().getBasketItem(product.id)!;
  }
}
