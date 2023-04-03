part of '../scan_screen.dart';

class _ScannedProductItem extends StatelessWidget {
  final ProductUIModel product;

  // ignore: use_key_in_widget_constructors
  const _ScannedProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              SizedBox(
                width: 88.w,
                child: ProductImageWidget(
                  product: product,
                  backgroundColor: Colors.transparent,
                  size: 67.r,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        '${product.name} (${product.quantity.toStringAsFixed(0)}gr)',
                        maxLines: 2,
                        style: TextStyleUtils.productType
                            .copyWith(fontSize: 13.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: ProductUnitAndPriceWidget(
                            product: product,
                            showDiscountPercents: false,
                            showOriginPrice: false,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        SizedBox(
                          width: 120.w,
                          height: 35.h,
                          child: AddToBasketButton(
                            product: product,
                            expandWidth: false,
                            center: false,
                          ),
                        ),
                        SizedBox(width: 4.w),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: RemoveButton(
            onPressed: () {
              context.read<IScanViewModel>().reScan();
            },
          ),
        )
      ],
    );
  }
}

class RemoveButton extends StatelessWidget {
  final Function() onPressed;
  final double size;
  final Color color;

  // ignore: use_key_in_widget_constructors
  RemoveButton({required this.onPressed, double? size, Color? color})
      : size = size ?? 16.r,
        color = color ?? ColorUtils.black86;

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      borderRadius: BorderRadius.circular(16.r),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(6.r),
        child: Icon(
          Icons.clear,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
