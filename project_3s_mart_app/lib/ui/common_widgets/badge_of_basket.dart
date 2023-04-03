import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:provider/provider.dart';
import 'ripple_click_effect.dart';

class BadgeOfBasket extends StatelessWidget {
  const BadgeOfBasket({
    Key? key,
    this.color,
  }) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Consumer<IBasketViewModel>(
      builder: (_, _viewModel, __) => Badge(
        position: BadgePosition.topStart(top: 4.h, start: 18.w),
        animationDuration: const Duration(milliseconds: 300),
        child: RippleClickEffect(
          borderRadius: BorderRadius.circular(32.r),
          onPressed: () {
            Get.toNamed(MyRouter.basket);
          },
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: SvgPicture.asset(
              'assets/images/basket.svg',
              color: color,
            ),
          ),
        ),
        animationType: BadgeAnimationType.scale,
        badgeColor: const Color(0xFFFFC01F),
        elevation: 1,
        padding: EdgeInsets.all(4.w),
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
    );
  }
}
