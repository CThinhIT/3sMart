import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/ui_models/category_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icategory_view_model.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/screens/product_category_screen/product_category_screen.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'widgets/category_item.dart';
part 'widgets/category_list.dart';
part 'widgets/subcategory_grid.dart';
part 'widgets/subcategory_grid_list.dart';
part 'widgets/subcategory_item.dart';

// ignore: use_key_in_widget_constructors
class CategoryScreen extends StatelessWidget {
  final _subcategoryScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primaryRedColor,
      bottomNavigationBar: const CustomBottomNavigationBar(
        value: NavigationBar.category,
      ),
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.productCategory.tr,
          isBackEnabled: false,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(MyRouter.searchProduct);
              },
              icon: SvgPicture.asset('assets/images/ic_search.svg'),
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Consumer<ICategoryViewModel>(
                builder: (_, vm, __) => Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _CategoryList(
                        initSelectedIndex: 0,
                        categories: vm.categories,
                        onItemPressed: (category, index) {
                          _subcategoryScrollController.scrollTo(
                            index: index,
                            duration: const Duration(milliseconds: 300),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: _SubcategoryGridList(
                        categories: vm.categories,
                        scrollController: _subcategoryScrollController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
