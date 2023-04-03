import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_gird_view_count.dart';

import 'product_item.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductUIModel> products;
  final bool isSliverList;
  final bool showDiscountPercents;

  // ignore: use_key_in_widget_constructors
  const ProductGridView({
    required this.products,
    this.isSliverList = false,
    this.showDiscountPercents = true,
  });

  @override
  Widget build(BuildContext context) {
    return isSliverList ? _buildSliverList() : _buildList();
  }

  Widget _buildSliverList() {
    return products.isNotEmpty
        ? SliverPadding(
            padding: EdgeInsets.all(16.r),
            sliver: SliverToBoxAdapter(
              child: CustomGridViewCount(
                mainAxisSpacing: 8.h,
                crossAxisCount: 3,
                children: products
                    .map(
                      (product) => ProductItem(
                        product: product,
                        showDiscountPercents: showDiscountPercents,
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        : const SliverToBoxAdapter(
            child: _NoProducts(),
          );
  }

  Widget _buildList() {
    return products.isNotEmpty
        ? Container(
            padding: EdgeInsets.all(16.r),
            color: Colors.white,
            child: CustomGridViewCount(
              mainAxisSpacing: 8.h,
              crossAxisCount: 3,
              children: products
                  .map(
                    (product) => ProductItem(
                      product: product,
                      showDiscountPercents: showDiscountPercents,
                    ),
                  )
                  .toList(),
            ),
          )
        : const _NoProducts();
  }
}

class _NoProducts extends StatelessWidget {
  const _NoProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Text(
        Strings.noProducts.tr,
        textAlign: TextAlign.center,
      ),
    );
  }
}
