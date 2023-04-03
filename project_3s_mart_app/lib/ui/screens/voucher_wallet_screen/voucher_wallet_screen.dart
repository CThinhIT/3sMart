import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ivoucher_view_model.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/decorated_tap_bar.dart';
import 'package:project_3s_mart_app/ui/screens/voucher_wallet_screen/widgets/voucher_wallet_widgets/hot_voucher_list.dart';
import 'package:project_3s_mart_app/ui/screens/voucher_wallet_screen/widgets/voucher_wallet_widgets/my_voucher_list.dart';
import 'package:project_3s_mart_app/ui/screens/voucher_wallet_screen/widgets/voucher_wallet_widgets/voucher_empty_state.dart';
import 'package:provider/provider.dart';

class VoucherWalletScreen extends StatelessWidget {
  const VoucherWalletScreen({
    Key? key,
    this.page = 0,
  }) : super(key: key);

  final int page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.vouchersWallet.tr,
          isBackEnabled: false,
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        value: NavigationBar.voucher,
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: page,
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 150.0,
              ),
              child: DecoratedTabBar(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorUtils.disableColor,
                      width: 2.w,
                    ),
                  ),
                ),
                tabBar: TabBar(
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                        color: ColorUtils.primaryRedColor, width: 2.0),
                  ),
                  labelColor: ColorUtils.primaryRedColor,
                  unselectedLabelColor: ColorUtils.black60,
                  tabs: [
                    Tab(
                      child: Text(
                        Strings.myVouchers.tr,
                        style: TextStyleUtils.bodyStrong.copyWith(),
                      ),
                    ),
                    Tab(
                      child: Text(
                        Strings.hotPromotionalVouchers.tr,
                        style: TextStyleUtils.bodyStrong.copyWith(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Consumer<IVoucherViewModel>(
                  builder: (context, vm, child) {
                    if (vm.myVouchers.isNotEmpty) {
                      return MyVoucherList(
                        vouchers: vm.myVouchers,
                      );
                    } else {
                      return const VoucherEmptyState();
                    }
                  },
                ),
                Consumer<IVoucherViewModel>(
                  builder: (context, vm, child) {
                    if (vm.hotVouchers.isNotEmpty) {
                      return HotVoucherList(
                        vouchers: vm.hotVouchers,
                      );
                    } else {
                      return const VoucherEmptyState();
                    }
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
