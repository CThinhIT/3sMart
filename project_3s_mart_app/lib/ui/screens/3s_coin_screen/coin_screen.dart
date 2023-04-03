import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_3s_mart_app/core/ui_models/coin_menu_item_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/coin_redeeming_category_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/coin_voucher_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icoin_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_button.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/common_widgets/session.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'widgets/available_coins.dart';

part 'widgets/banners.dart';
part 'widgets/coin.dart';
part 'widgets/coin_menu.dart';
part 'widgets/coin_redeeming_category_list.dart';
part 'widgets/coin_redeeming_category_item.dart';
part 'widgets/coin_voucher_item.dart';
part 'widgets/coin_voucher_list.dart';
part 'widgets/view_voucher_wallet_button.dart';

class CoinScreen extends StatelessWidget {
  const CoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(title: Strings.coinWallet.tr, isCancelEnabled: false),
      ),
      bottomNavigationBar: const _ViewVoucherWalletButton(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AvailableCoins(),
            Divider(thickness: 4.r, color: ColorUtils.divider),
            SectionWidget(
              title: Strings.bigEvent.tr,
              titleToChildSpace: 12.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _Banners(),
                  SizedBox(height: 8.h),
                  const _CoinMenu(),
                ],
              ),
            ),
            const Divider(thickness: 4, color: ColorUtils.divider),
            SectionWidget(
              title: Strings.redeem3sCoins.tr,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _ConiRedeemingCategoryList(),
                  _CoinVoucherList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
