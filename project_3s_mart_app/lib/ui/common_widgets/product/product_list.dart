import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/ui/common_widgets/product/product_item.dart';

class ProductList extends StatelessWidget {
  final List<ProductUIModel> products;
  final EdgeInsets padding;
  final bool showDiscountPercents;
  final double height;

  // ignore: use_key_in_widget_constructors
  ProductList({
    required this.products,
    this.showDiscountPercents = true,
    double? height,
    EdgeInsets? padding,
  })  : padding = padding ?? EdgeInsets.symmetric(vertical: 16.h),
        height = height ?? 328.h;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: height,
      padding: padding,
      //constraints: BoxConstraints(minHeight: 188.h),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: products
                .map(
                  (product) => Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: ProductItem(
                      product: product,
                      showDiscountPercents: showDiscountPercents,
                      carousel: true,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
