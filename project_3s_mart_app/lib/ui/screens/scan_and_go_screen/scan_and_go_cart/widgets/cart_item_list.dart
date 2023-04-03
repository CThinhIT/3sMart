part of "../scan_and_go_cart_screen.dart";

class _CartItemList extends StatelessWidget {
  final List<BasketItemUIModel> basketProducts;

  // ignore: use_key_in_widget_constructors
  const _CartItemList({
    required this.basketProducts,
  });

  @override
  Widget build(BuildContext context) {
    return basketProducts.isNotEmpty
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) => Column(
              children: [
                _CartItem(
                  basketItem: basketProducts[index],
                  index: index + 1,
                ),
                Divider(
                  height: 2.h,
                  thickness: 2.h,
                  color: ColorUtils.divider,
                ),
              ],
            ),
            itemCount: basketProducts.length,
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
          )
        : Center(
          child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Text(Strings.emptyBasket.tr),
            ),
        );
  }
}
