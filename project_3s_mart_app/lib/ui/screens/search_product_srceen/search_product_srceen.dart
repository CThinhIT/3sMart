import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/category_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icategory_view_model.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/badge_of_basket.dart';
import 'package:project_3s_mart_app/ui/common_widgets/product/product_list.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/common_widgets/search_bar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/session.dart';
import 'package:project_3s_mart_app/ui/screens/product_category_screen/product_category_screen.dart';
import 'package:provider/provider.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.greyLight,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(Strings.searchProduct.tr),
        toolbarHeight: 48.h,
        titleTextStyle: TextStyleUtils.heading3.copyWith(
          color: ColorUtils.black,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: const BackButton(
          color: ColorUtils.black,
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: const BadgeOfBasket(
              color: ColorUtils.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 64.h,
              width: double.infinity,
              color: ColorUtils.white,
              child: Center(
                child: SearchBar(
                  width: 343.w,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              color: ColorUtils.white,
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              height: 200.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.popularSearch.tr,
                    style: TextStyleUtils.heading3.copyWith(
                      color: ColorUtils.black,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Expanded(
                    child: Selector<ICategoryViewModel, List<CategoryUIModel>?>(
                      selector: (_, vm) => vm.subcategories,
                      builder: (_, searchedProducts, __) {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            Wrap(
                              children: [
                                ...searchedProducts?.map(
                                      (subcategory) => _SearchItem(
                                        category: subcategory,
                                      ),
                                    ) ??
                                    [],
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              color: ColorUtils.white,
              child: SectionWidget(
                title: Strings.onSale.tr,
                onViewAllPressed: () {
                  Get.toNamed(MyRouter.productCategory);
                },
                child: ProductList(
                  products: ProductUIModel.listSelingProductsDemo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchItem extends StatelessWidget {
  const _SearchItem({Key? key, required this.category}) : super(key: key);
  final CategoryUIModel category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 4.w, 8.h),
      child: RippleClickEffect(
        onPressed: () {
          Get.toNamed(
            MyRouter.productCategory,
            arguments: ProductFilterArguments(
              subcategoryId: category.id,
            ),
          );
        },
        color: ColorUtils.grey,
        borderRadius: BorderRadius.circular(24.r),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Text(
            category.name,
            style: TextStyleUtils.button.copyWith(
              color: ColorUtils.black86,
            ),
          ),
        ),
      ),
    );
  }
}
