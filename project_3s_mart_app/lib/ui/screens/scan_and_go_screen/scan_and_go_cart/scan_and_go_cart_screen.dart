import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/ui_models/basket_item_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/basket_item_counter.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/index_widget.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/utils/dialog_utils.dart';
import 'package:provider/provider.dart';
import 'widgets/scan_and_go_cart_footer.dart';
part 'widgets/cart_add_item_button.dart';
part 'widgets/cart_item.dart';
part 'widgets/cart_item_list.dart';
part 'widgets/payment_overview.dart';


class ScanAndGoToCartScreen extends StatelessWidget {
  const ScanAndGoToCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ScanAndGoCartFooter(
        onPressed: () {
          Get.toNamed(MyRouter.scanAndGoDeliveryMethod);
        },
        title: Strings.placeOrder.tr,
      ),
      floatingActionButton: const _CartAddItemBtn(),
      appBar: CustomAppBar(
        AppBarOption(title: Strings.yourBasket.tr),
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Consumer<IBasketViewModel>(
                  builder: (_, vm, __) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          child: Text(
                              "${Strings.productsInBasket.tr} (${vm.basketQuantity}):",
                              style: TextStyleUtils.title),
                        ),
                        _CartItemList(
                          basketProducts: vm.basketItems,
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 95.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
