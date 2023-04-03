import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';
import 'package:project_3s_mart_app/core/ui_models/order_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorders_management_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/decorated_tap_bar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:provider/provider.dart';
part 'widgets/order_item.dart';

class OrdersManagementScreen extends StatelessWidget {
  const OrdersManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.ordersManagement.tr,
        ),
      ),
      body: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Column(
          children: [
            DecoratedTabBar(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: const Color(0xFFE2E2E2),
                    width: 2.0.h,
                  ),
                ),
              ),
              tabBar: TabBar(
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: ColorUtils.primaryRedColor,
                    width: 2.0.h,
                  ),
                ),
                labelColor: ColorUtils.primaryRedColor,
                unselectedLabelColor: ColorUtils.black.withOpacity(0.38),
                labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
                tabs: [
                  Tab(
                    child: Text(
                      Strings.waitForPay.tr,
                      style: TextStyleUtils.bodyStrong,
                    ),
                  ),
                  Tab(
                    child: Text(
                      Strings.processing.tr,
                      style: TextStyleUtils.bodyStrong,
                    ),
                  ),
                  Tab(
                    child: Text(
                      Strings.canceled.tr,
                      style: TextStyleUtils.bodyStrong,
                    ),
                  ),
                  Tab(
                    child: Text(
                      Strings.all.tr,
                      style: TextStyleUtils.bodyStrong,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Consumer<IOrdersManagementViewModel>(
                    builder: (_, _viewModel, __) {
                      return ListView.separated(
                        itemCount: _viewModel.listOrders.length,
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 1,
                            color: const Color(0xFFEBEBEB),
                            height: 1.h,
                          );
                        },
                        itemBuilder: (context, index) {
                          return _OrderItem(
                            order: _viewModel.listOrders[index],
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
