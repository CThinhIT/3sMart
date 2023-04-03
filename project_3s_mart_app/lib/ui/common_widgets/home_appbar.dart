import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/ui/common_widgets/select_supermarket.dart';
import 'package:provider/provider.dart';

import 'ripple_click_effect.dart';

/// App bar that is used for home, category screen, ...
///
// ignore: use_key_in_widget_constructors
class HomeAppBar extends StatelessWidget {
  final Widget leading;

  // ignore: use_key_in_widget_constructors
  const HomeAppBar({this.leading = const SelectSupertmarket()});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading,
          Row(
            children: [
              RippleClickEffect(
                child: SvgPicture.asset(
                  'assets/images/ic_noti.svg',
                  color: Colors.white,
                ),
                onPressed: () {
                  /// TODO
                },
              ),
              SizedBox(width: 14.w),
              Consumer<IBasketViewModel>(
                builder: (_, _viewModel, __) => Badge(
                  position: BadgePosition.bottomStart(
                    bottom: 7.h,
                    start: 10.w,
                  ),
                  child: RippleClickEffect(
                    onPressed: () => Get.toNamed(MyRouter.basket),
                    child: SvgPicture.asset(
                      'assets/images/basket.svg',
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.all(3.5.w),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.scale,
                  badgeColor: const Color(0xFFFFC01F),
                  elevation: 1,
                  badgeContent: _viewModel.basketItems.isNotEmpty
                      ? Center(
                          child: Text(
                            '${_viewModel.basketQuantity}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
