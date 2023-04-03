part of '../product_detail_screen.dart';

class _ProductBody extends StatelessWidget {
  const _ProductBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductUIModel product;

  @override
  Widget build(BuildContext context) {
    var _vm = context.read<IBasketViewModel>();
    final String unitType = EnumHelper.getDescription(
      EnumMap.productUnitType,
      product.unitType,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: TextStyleUtils.title.copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            unitType,
            style: TextStyleUtils.body.copyWith(
              color: ColorUtils.black60,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            CurrencyUtils.formatCurrency(product.unitPriceAfterDiscount),
            style: TextStyleUtils.heading3.copyWith(
              color: ColorUtils.primaryRedColor,
            ),
          ),
          SizedBox(height: 3.h),
          product.unitPrice != product.unitPriceAfterDiscount
              ? Row(
                  children: [
                    Text(
                      '${Strings.originalPrice.tr}: ',
                      style: TextStyleUtils.body.copyWith(
                        color: ColorUtils.black60,
                      ),
                    ),
                    Text(
                      CurrencyUtils.formatCurrency(product.unitPrice),
                      style: TextStyleUtils.body.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: ColorUtils.black60,
                      ),
                    )
                  ],
                )
              : const SizedBox.shrink(),
          SizedBox(height: 10.h),
          Consumer<IBasketViewModel>(builder: (_, _viewModel, __) {
            var itemQuantity = _viewModel.getBasketItemQuantity(product.id);
            return itemQuantity == 0
                ? AddCartAnimOnPressedWidget(
                    product: product,
                    child: CustomButton(
                      onPressed: () {
                        _viewModel.addBasketItem(
                          product,
                        );
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
                  )
                : QuantityGroupButton(
                    enableAddCartAnim: true,
                    currentValue: itemQuantity,
                    onIncrease: () {
                      _viewModel.addQuantity(product.id, 1);
                    },
                    onDecrease: itemQuantity > 0
                        ? () {
                            _viewModel.addQuantity(product.id, -1);
                          }
                        : null,
                    product: product,
                  );
          })
        ],
      ),
    );
  }
}
