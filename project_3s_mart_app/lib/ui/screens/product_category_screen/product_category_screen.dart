import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/badge_of_basket.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/utils/add_cart_anim_utils.dart';
import 'package:provider/provider.dart';

import 'package:project_3s_mart_app/core/ui_models/category_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icategory_view_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iproduct_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/my_sliver_persistent_delegate.dart';
import 'package:project_3s_mart_app/ui/common_widgets/product/product_gridview.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/common_widgets/shopping_cart_floating_button.dart';
import 'package:project_3s_mart_app/ui/utils/add_cart_anim_utils.dart';
import 'package:provider/provider.dart';

part 'widgets/category_tag_item.dart';
part 'widgets/category_tag_list.dart';
part 'widgets/subcategory_item.dart';
part 'widgets/subcategory_list.dart';

class ProductFilterArguments {
  String? subcategoryId;
  String? subSubcategoryId;
  double? fromPrice;
  double? toPrice;

  ProductFilterArguments({
    this.subcategoryId,
    this.subSubcategoryId,
    this.fromPrice,
    this.toPrice,
  });
}

class ProductCategoryScreen extends StatelessWidget {
  final ProductFilterArguments? filter;

  // ignore: use_key_in_widget_constructors
  const ProductCategoryScreen({this.filter});

  @override
  Widget build(BuildContext context) {
    handleSelectingSubcategory(context);
    searchProducts(context);
    return Scaffold(
      key: AddCartAnimUtils.productCategoryScreenKey,
      backgroundColor: ColorUtils.primaryRedColor,
      bottomNavigationBar: const CustomBottomNavigationBar(
        value: NavigationBar.category,
      ),
      appBar: CustomAppBar(
        AppBarOption(title: Strings.productCategory.tr, actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: RippleClickEffect(
              borderRadius: BorderRadius.circular(32.r),
              onPressed: () {
                Get.toNamed(MyRouter.searchProduct);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: SvgPicture.asset('assets/images/ic_search.svg'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.w, left: 6.w),
            child: const BadgeOfBasket(
              color: Colors.white,
            ),
          ),
        ]),
      ),
      floatingActionButton: ShoppingCartFloatingButton(
          key: AddCartAnimUtils.productCategoryShoppingCartBtnKey),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    delegate: MySliverPersistentHeaderDelegate(
                      height: 88.h,
                      child: Container(
                        color: ColorUtils.greyLight,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 12.r),
                        child: const _SubcategoryList(),
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: MySliverPersistentHeaderDelegate(
                      height: 54.h,
                      child: Container(
                        color: ColorUtils.greyLight,
                        padding: EdgeInsets.fromLTRB(16.w, 8.h, 0, 8.h),
                        child: const _CategoryTagList(),
                      ),
                    ),
                  ),
                  Consumer<IProductViewModel>(
                    builder: (_, vm, __) {
                      return vm.searchedProducts != null
                          ? ProductGridView(
                              products: vm.searchedProducts!,
                              isSliverList: true,
                              showDiscountPercents: false,
                            )
                          : const SliverToBoxAdapter(
                              child: SizedBox.shrink(),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void searchProducts(BuildContext context) {
    var vm = context.read<IProductViewModel>();
    vm.clearSearchedProducts();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      vm.searchProducts(filter);
    });
  }

  void handleSelectingSubcategory(BuildContext context) {
    if (filter?.subcategoryId != null) {
      var categoryVm = context.read<ICategoryViewModel>();
      categoryVm.selectSubcategoryById(filter!.subcategoryId!);
    }
  }
}
