part of "../scan_and_go_cart_screen.dart";

class _CartItem extends StatelessWidget {
  final BasketItemUIModel basketItem;
  final int index;

  // ignore: use_key_in_widget_constructors
  const _CartItem({
    required this.basketItem,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      color: Colors.white,
      child: IntrinsicHeight(
        child: IndexWidget(
          index: index,
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
        image: DecorationImage(
          image: AssetImage(imageUrl),
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
