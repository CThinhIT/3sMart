import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iscan_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/utils/add_cart_anim_utils.dart';
import 'package:provider/provider.dart';

class ScannerBottomBar extends StatefulWidget {
  const ScannerBottomBar({Key? key, required this.value}) : super(key: key);

  @override
  State<ScannerBottomBar> createState() => _ScannerBottomBarState();

  final NavigationScanBar value;
}

class _ScannerBottomBarState extends State<ScannerBottomBar> {
  // var _selectedNavItemIndex = 1;

  // void _selectNavItem(int index) {
  //   setState(() {
  //     _selectedNavItemIndex = index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.alphaBlend(
          Colors.black.withOpacity(0.2),
          ColorUtils.primaryRedColor,
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: 26.h,
        top: 12.h,
        left: 16.w,
        right: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _ScanBottomNavItem(
              key: AddCartAnimUtils.scanBasketBtnKey,
              svgIconAsset: 'assets/images/basket.svg',
              title: Strings.basket.tr,
              isSelected: widget.value == NavigationScanBar.cartScan,
              onPressed: () async {
                Get.toNamed(MyRouter.scanAndGoToCart);
              },
            ),
          ),
          Expanded(
            child: _ScanBottomNavItem(
              svgIconAsset: 'assets/images/ic_scan2.svg',
              title: Strings.scan.tr,
              isSelected: widget.value == NavigationScanBar.scan,
              onPressed: () {
                Get.offNamed(MyRouter.scan);
              },
            ),
          ),
          Expanded(
            child: _ScanBottomNavItem(
              svgIconAsset: 'assets/images/ic_account.svg',
              title: Strings.account.tr,
              isSelected: widget.value == NavigationScanBar.accountScan,
              onPressed: () async {
                Get.offNamed(MyRouter.account, arguments: false);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _navigateTo(
  String routeName,
  BuildContext context, {
  dynamic arguments,
}) async {
  var vm = context.read<IScanViewModel>();
  await vm.stopScan();

  await Get.toNamed(routeName, arguments: arguments);
  //await vm.reScan();
}

class _ScanBottomNavItem extends StatelessWidget {
  final String title;
  final String svgIconAsset;
  final bool isSelected;
  final Function() onPressed;

  const _ScanBottomNavItem({
    Key? key,
    required this.title,
    required this.svgIconAsset,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: isSelected
              ? const BorderSide(color: Colors.white)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(8.r),
        ),
        primary: isSelected
            ? Colors.white.withOpacity(0.12)
            : Color.alphaBlend(
                Colors.black.withOpacity(0.2),
                ColorUtils.primaryRedColor,
              ),
        minimumSize: Size.zero,
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 8.w,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgIconAsset,
            color: Colors.white,
            width: 24.w,
            height: 24.w,
          ),
          SizedBox(width: 6.w),
          Text(title, style: TextStyleUtils.button),
        ],
      ),
    );
  }
}
