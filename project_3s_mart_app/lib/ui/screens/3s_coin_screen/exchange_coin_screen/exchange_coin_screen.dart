import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/common_widgets/session.dart';
import 'package:project_3s_mart_app/ui/screens/3s_coin_screen/widgets/available_coins.dart';
import 'package:get/get.dart';

part 'widgets/exchange_coin_banner_item.dart';
part 'widgets/exchange_coin_banner_list.dart';


class ExchangeCoinScreen extends StatelessWidget {
  const ExchangeCoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        AppBarOption(
          title: Strings.redeem3sCoins.tr,
          isCancelEnabled: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AvailableCoins(
              isExchangeCoinBtnShown: false,
            ),
            Divider(thickness: 4.r, color: ColorUtils.divider),
            SectionWidget(
              title: Strings.redeem3sCoins.tr,
              titleToChildSpace: 12.h,
              child: const _ExchangeCoinBannerList(),
            ),
          ],
        ),
      ),
    );
  }
}
