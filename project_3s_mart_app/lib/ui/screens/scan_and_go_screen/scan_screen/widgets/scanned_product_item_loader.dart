part of '../scan_screen.dart';

class _ScannedProductItemLoader extends StatelessWidget {
  final String productId;

  // ignore: use_key_in_widget_constructors
  const _ScannedProductItemLoader(this.productId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<IProductViewModel>().getById(productId),
      builder: (_, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          var product = snapshot.data as ProductUIModel;
          return Padding(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
            child: _ScannedProductItem(product: product),
          );
        }
        return Padding(
          padding: EdgeInsets.only(top: 48.h),
          child: CircleProgressWidget(),
        );
      },
    );
  }
}
