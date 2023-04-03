import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/home_appbar.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';
import 'package:project_3s_mart_app/ui/screens/scan_and_go_screen/scan_screen/widgets/scanner_bottom_bar.dart';
import 'widgets/account_item_widget.dart';
part 'widgets/body.dart';
part 'widgets/header.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({
    Key? key,
    this.isOnlineShopping = true,
  }) : super(key: key);

  final bool isOnlineShopping;

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
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              _Header(
                isOnlineShopping: isOnlineShopping,
              ),
              SizedBox(height: 16.h),
              const _Body(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: isOnlineShopping
          ? const CustomBottomNavigationBar(
              value: NavigationBar.account,
            )
          : const ScannerBottomBar(
              value: NavigationScanBar.accountScan,
            ),
    );
  }
}
