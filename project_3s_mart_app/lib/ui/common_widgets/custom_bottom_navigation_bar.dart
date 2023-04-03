import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/enum.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/ripple_click_effect.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final NavigationBar value;
  const CustomBottomNavigationBar({Key? key, required this.value})
      : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorUtils.white,
        border: Border(
          top: BorderSide(
            color: ColorUtils.grey,
            width: 2.w,
          ),
        ),
      ),
      height: 72.5.h,
      padding: EdgeInsets.only(
        bottom: 24.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: BottomBarItem(
              onTap: () {
                Get.offNamed(MyRouter.home);
              },
              title: Strings.home.tr,
              image: 'assets/images/ic_home.svg',
              isSelected: widget.value == NavigationBar.home,
            ),
          ),
          Expanded(
            child: BottomBarItem(
              onTap: () {
                Get.offNamed(MyRouter.category);
              },
              title: Strings.category.tr,
              image: 'assets/images/ic_categories.svg',
              isSelected: widget.value == NavigationBar.category,
            ),
          ),
          Expanded(
            child: BottomBarItem(
              onTap: () {
                Get.offNamed(MyRouter.voucherWallet);
              },
              title: Strings.voucher.tr,
              image: 'assets/images/ic_voucher.svg',
              isSelected: widget.value == NavigationBar.voucher,
            ),
          ),
          Expanded(
            child: BottomBarItem(
              onTap: () {
                Get.offNamed(MyRouter.account);
              },
              title: Strings.account.tr,
              image: 'assets/images/ic_account.svg',
              isSelected: widget.value == NavigationBar.account,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String image;
  final bool isSelected;
  const BottomBarItem({
    Key? key,
    required this.onTap,
    required this.title,
    required this.image,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
            child: SvgPicture.asset(
              image,
              fit: BoxFit.cover,
              color: isSelected
                  ? ColorUtils.primaryRedColor
                  : const Color(0xFF979797),
            ),
          ),
          Text(
            title,
            style: TextStyleUtils.footnoteSemiBold.copyWith(
              color: isSelected
                  ? ColorUtils.primaryRedColor
                  : const Color.fromRGBO(135, 135, 135, 1),
            ),
          ),
        ],
      ),
    );
  }
}
