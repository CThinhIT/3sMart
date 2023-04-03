import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/basket_item_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/currency_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/basket_item_counter.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/discount_code.dart';
import 'package:project_3s_mart_app/ui/common_widgets/product/product_list.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/common_widgets/session.dart';
import 'package:project_3s_mart_app/ui/utils/dialog_utils.dart';
import 'package:provider/provider.dart';

part 'widgets/basket_item_list.dart';
part 'widgets/payment_overview.dart';
part 'widgets/total_payment_and_order_btn.dart';

// ignore: use_key_in_widget_constructors
class BasketScreen extends StatelessWidget {
  final _scrollController = ScrollController(
    keepScrollOffset: false,
    initialScrollOffset: 99999, // big enough to scroll to top on init
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          AppBarOption(title: Strings.yourBasket.tr),
        ),
        bottomNavigationBar: const _TotalPaymentAndOrderBtn(),
        body: SingleChildScrollView(
          controller: _scrollController,
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _BasketItemList(),
              Divider(
                thickness: 4.h,
                color: ColorUtils.divider,
                height: 2.h,
              ),
              const DiscountCode(),
              Divider(
                thickness: 4.h,
                color: ColorUtils.divider,
                height: 0,
              ),
              const _PaymentOverview(),
              SectionWidget(
                title: Strings.suggestedComobo.tr,
                onViewAllPressed: () {
                  Get.toNamed(MyRouter.productCategory);
                },
                child: ProductList(
                  products: ProductUIModel.comboProducts,
                  showDiscountPercents: false,
                  height: 280.h,
                ),
              ),
              Divider(
                thickness: 4.h,
                color: ColorUtils.divider,
                height: 0,
              ),
              SectionWidget(
                title: Strings.bestSellingProducts.tr,
                onViewAllPressed: () {
                  Get.toNamed(MyRouter.productCategory);
                },
                child: ProductList(
                  products: ProductUIModel.listSelingProductsDemo,
                ),
              ),
            ],
          ),
        ));
  }
}
