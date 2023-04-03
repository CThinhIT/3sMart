part of '../basket_screen.dart';

class _BasketItemList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const _BasketItemList();

  @override
  Widget build(BuildContext context) {
    return Consumer<IBasketViewModel>(
      builder: (_, vm, __) {
        return vm.isBasketNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Text(
                        "${Strings.productsInBasket.tr} (${vm.basketQuantity}):",
                        style: TextStyleUtils.title),
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) => _BasketItem(
                      basketItem: vm.basketItems[index],
                      index: index + 1,
                    ),
                    separatorBuilder: (_, __) => Divider(
                      height: 2.h,
                      thickness: 2.h,
                      color: ColorUtils.divider,
                    ),
                    itemCount: vm.basketItems.length,
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                  ),
                ],
              )
            : const _EmptyBasket();
      },
    );
  }
}

class _BasketItem extends StatelessWidget {
  final BasketItemUIModel basketItem;

  /// Start from 1
  final int index;

  // ignore: use_key_in_widget_constructors
  const _BasketItem({
    required this.basketItem,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      color: Colors.white,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Image(imageUrl: basketItem.product.imageUrl),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                children: [
                  _NameAndRemoveButton(basketItem: basketItem),
                  SizedBox(height: 10.h),
                  _PriceAndCounter(basketProduct: basketItem),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.r,
      height: 80.r,
      decoration: BoxDecoration(
        color: ColorUtils.white,
        borderRadius: BorderRadius.circular(16.r),

        /// TODO: Remove demo asset image
        image: DecorationImage(
          image: (imageUrl.contains('http')
              ? CachedNetworkImageProvider(imageUrl)
              : AssetImage(imageUrl)) as ImageProvider<Object>,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _NameAndRemoveButton extends StatelessWidget {
  const _NameAndRemoveButton({required this.basketItem});

  final BasketItemUIModel basketItem;

  @override
  Widget build(BuildContext context) {
    final String unitType = EnumHelper.getDescription(
      EnumMap.productUnitType,
      basketItem.product.unitType,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                basketItem.product.name,
                style: TextStyleUtils.productType.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
              Text(
                '($unitType)',
                style: TextStyleUtils.productType.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 4.w),
        RippleClickEffect(
          borderRadius: BorderRadius.circular(16.r),
          onPressed: () => _confirmRemove(context),
          child: Padding(
            padding: EdgeInsets.all(4.r),
            child: SvgPicture.asset('assets/images/ic_remove.svg'),
          ),
        ),
      ],
    );
  }

  void _confirmRemove(BuildContext context) {
    DialogUtils.showYesNoDialog(
      title: Strings.confirmRemovingBasketProduct.tr,
      onYes: () {
        context
            .read<IBasketViewModel>()
            .removeBasketItem(basketItem.product.id);
      },
    );
  }
}

class _PriceAndCounter extends StatelessWidget {
  const _PriceAndCounter({required this.basketProduct});

  final BasketItemUIModel basketProduct;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          CurrencyUtils.formatCurrency(basketProduct.totalPriceAfterDiscount),
          style: TextStyleUtils.subHeadingRegular
              .copyWith(color: ColorUtils.primaryRedColor),
        ),
        BasketItemCounter(basketItem: basketProduct),
      ],
    );
  }
}

class _EmptyBasket extends StatelessWidget {
  const _EmptyBasket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Text(Strings.emptyBasket.tr),
    );
  }
}
