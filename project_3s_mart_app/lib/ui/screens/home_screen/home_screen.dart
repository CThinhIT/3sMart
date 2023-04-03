import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/category_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ihome_viewmodel.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorder_info_view_model.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/app_translation.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/home_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/product/product_gridview.dart';
import 'package:project_3s_mart_app/ui/common_widgets/product/product_list.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/common_widgets/select_supermarket.dart';
import 'package:project_3s_mart_app/ui/common_widgets/session.dart';
import 'package:project_3s_mart_app/ui/common_widgets/shopping_cart_floating_button.dart';
import 'package:project_3s_mart_app/ui/screens/product_category_screen/product_category_screen.dart';
import 'package:project_3s_mart_app/ui/utils/add_cart_anim_utils.dart';
import 'package:provider/provider.dart';

part 'package:project_3s_mart_app/ui/screens/home_screen/widgets/promotions.dart';
part 'widgets/animted_header_delegate.dart';
part 'widgets/banners.dart';
part 'widgets/branch_to_shop.dart';
part 'widgets/discount_code.dart';
part 'widgets/popular_categories.dart';
part 'widgets/reward_point.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _maxExtentAnimation;
  @override
  void initState() {
    super.initState();
    _maxExtentAnimation =
        AnimationController.unbounded(vsync: this, value: 96.h);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: ColorUtils.primaryRedColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorUtils.primaryRedColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      key: AddCartAnimUtils.homeScreenKey,
      backgroundColor: ColorUtils.white,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _maxExtentAnimation,
            builder: (context, child) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    floating: false,
                    delegate: _AnimatedHeaderDelegate(
                      onTap: () {
                        Get.toNamed(MyRouter.searchProduct);
                      },
                      readOnly: true,
                      minExtent: 48.h,
                      maxExtent: 96.h,
                    ),
                  ),
                  child!,
                ],
              );
            },
            child: SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 10.h),
                const _MyBanner(),
                const _PopularCategories(),
                Divider(
                  thickness: 4.h,
                  color: ColorUtils.divider,
                ),
                const _DiscountCode(),
                Divider(
                  thickness: 4.h,
                  color: ColorUtils.divider,
                ),
                const _RewardPoint(),
                Divider(
                  thickness: 4.h,
                  color: ColorUtils.divider,
                ),
                const _Promotions(),
                SizedBox(height: 10.h),
                Divider(
                  thickness: 4.h,
                  color: ColorUtils.divider,
                ),
                SectionWidget(
                  title: Strings.bestSellingProducts.tr,
                  onViewAllPressed: goToSearchHotProducts,
                  child: ProductList(
                    products: ProductUIModel.listSelingProductsDemo,
                  ),
                ),
                Divider(
                  thickness: 4.h,
                  color: ColorUtils.divider,
                ),
                SectionWidget(
                  title: Strings.freshVegetablesAndFruits.tr,
                  onViewAllPressed: goToSearchVegetableProducts,
                  child: Consumer<IHomeViewModel>(builder: (_, _viewModel, __) {
                    return ProductGridView(
                      products: _viewModel.listVegetableAndFruitProducts,
                      showDiscountPercents: false,
                    );
                  }),
                ),
              ]),
            ),
          ),

          /// Overlap home screen with [AbsorbPointer]
          /// to disable scrolling when the market changing guide popup showing
          /// to ignore 'negative padding error' due to scrolling by users before the popup showing
          Selector<IOrderInfoViewModel, bool>(
            selector: (_, vm) => vm.tutorialState,
            builder: (_, isMarketChangePopupShowing, __) =>
                isMarketChangePopupShowing
                    ? const Positioned.fill(child: AbsorbPointer())
                    : const SizedBox.shrink(),
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        value: NavigationBar.home,
      ),
      floatingActionButton: ShoppingCartFloatingButton(
        key: AddCartAnimUtils.homeShoppingCartBtnKey,
      ),
    );
  }

  void goToSearchVegetableProducts() {
    Get.toNamed(
      MyRouter.productCategory,
      arguments: ProductFilterArguments(
        // vegetable category id
        subcategoryId: CategoryUIModel.subcategoriesInSearchProducts[5].id,
      ),
    );
  }

  void goToSearchHotProducts() {
    Get.toNamed(
      MyRouter.productCategory,
      arguments: ProductFilterArguments(
        // Treating that meat category products = hot products
        // TODO: Go to search hot products
        subcategoryId: CategoryUIModel.subcategoriesInSearchProducts[0].id,
      ),
    );
  }
}
