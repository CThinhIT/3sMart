part of '../order_info_step1_screen.dart';

class _BasketItemList extends StatelessWidget {
  const _BasketItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.productsInBasket.tr,
            style: TextStyleUtils.title,
          ),
          SizedBox(
            height: 16.h,
          ),
          Consumer<IBasketViewModel>(builder: (_, _viewModel, __) {
            return ListView.separated(
              itemCount: _viewModel.basketsCount + 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => index != _viewModel.basketsCount
                  ? _BasketItem(
                      basketItem: _viewModel.basketItems[index],
                      index: index + 1,
                    )
                  : _viewModel.basketItems.length > 2
                      ? TextButton(
                          onPressed: () {
                            _viewModel.onLoadMore();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _viewModel.basketsCount ==
                                        _viewModel.basketItems.length
                                    ? Strings.collapse.tr
                                    : '(${_viewModel.basketQuantity}) ${Strings.productsInBasket.tr.toLowerCase()}',
                                style: TextStyleUtils.button.copyWith(
                                  color: ColorUtils.black86,
                                ),
                              ),
                              Icon(
                                _viewModel.basketsCount ==
                                        _viewModel.basketItems.length
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: ColorUtils.black86,
                              )
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
              separatorBuilder: (BuildContext context, int index) =>
                  index != _viewModel.basketsCount - 1
                      ? const Divider(
                          thickness: 1,
                          color: ColorUtils.divider,
                        )
                      : const SizedBox.shrink(),
            );
          }),
        ],
      ),
    );
  }
}

class _BasketItem extends StatelessWidget {
  final BasketItemUIModel basketItem;
  final int index;

  const _BasketItem({
    Key? key,
    required this.basketItem,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String unitType = EnumHelper.getDescription(
      EnumMap.productUnitType,
      basketItem.product.unitType,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
              image: AssetImage(
                basketItem.product.imageUrl,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                basketItem.product.name,
                style: TextStyleUtils.footnoteSemiBold,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      '${basketItem.quantity} ($unitType)',
                      style: TextStyleUtils.body.copyWith(
                        color: ColorUtils.black60,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                    child: Text(
                      'X',
                      style: TextStyleUtils.body.copyWith(
                        color: ColorUtils.black60,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    CurrencyUtils.formatCurrency(
                        basketItem.product.unitPriceAfterDiscount),
                    style: TextStyleUtils.body.copyWith(
                      color: ColorUtils.black60,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    CurrencyUtils.formatCurrency(
                      basketItem.product.unitPriceAfterDiscount *
                          basketItem.quantity,
                    ),
                    style: TextStyleUtils.body,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
