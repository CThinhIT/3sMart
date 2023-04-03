import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/ui_models/coupon_ui_model.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/date_time_extension.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ibasket_viewmodel.dart';
import 'package:project_3s_mart_app/translation/app_translation.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:provider/provider.dart';

class CouponList extends StatelessWidget {
  final List<CouponUIModel> coupons;

  const CouponList({
    Key? key,
    required this.coupons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: coupons
          .map(
            (coupon) => Container(
              margin: EdgeInsets.only(
                top: 16.h,
                right: 16.w,
                left: 16.w,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF18274B).withOpacity(0.12),
                    blurRadius: 4.r,
                    spreadRadius: 2.0,
                    offset:
                        Offset(2.0.w, 2.0.h), // shadow direction: bottom right
                  )
                ],
              ),
              child: _QuickCouponItem(
                coupon: coupon,
                showImage: true,
              ),
            ),
          )
          .toList(),
    );
  }
}

class QuickCouponList extends StatelessWidget {
  final List<CouponUIModel> coupons;

  const QuickCouponList({
    Key? key,
    required this.coupons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: coupons
            .map(
              (coupon) => Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x1418274B),
                      blurRadius: 4.r,
                      spreadRadius: 0.0,
                      offset: Offset(
                        2.0.w,
                        2.0.h,
                      ), // shadow direction: bottom right
                    )
                  ],
                ),
                margin: EdgeInsets.only(
                  top: 12.h,
                  left: 16.w,
                  right: 4.w,
                  bottom: 8.h,
                ),
                child: _QuickCouponItem(
                  coupon: coupon,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _QuickCouponItem extends StatelessWidget {
  final CouponUIModel coupon;
  final bool showImage;

  const _QuickCouponItem({
    Key? key,
    required this.coupon,
    this.showImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CouponCardClipper(right: 65.w, holeRadius: 14.r),
      child: Selector<IBasketViewModel, bool>(
        selector: (_, vm) => vm.selectedCoupon == coupon,
        builder: (_, isSelected, __) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 0.80.sw,
            padding: EdgeInsets.fromLTRB(12.r, 1.r, 1.r, 1.r),
            decoration: BoxDecoration(
              color: isSelected ? ColorUtils.primaryRedColor : Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: _CouponItem(
              coupon: coupon,
              showImage: showImage,
              roundLeftBorder: !isSelected,
            ),
          );
        },
      ),
    );
  }
}

class _CouponItem extends StatelessWidget {
  final CouponUIModel coupon;
  final halfCircleRightOffset = 64.w;
  final circleRadius = 14.r;
  final bool showImage;
  final bool roundLeftBorder;

  _CouponItem({
    Key? key,
    required this.coupon,
    this.showImage = true,
    this.roundLeftBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CouponCardClipper(
        holeRadius: circleRadius,
        right: halfCircleRightOffset,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(roundLeftBorder ? 12.r : 0),
            right: Radius.circular(12.r),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2.h),
              color: const Color(0x1418274B),
              blurRadius: 8.r,
              spreadRadius: -4.r,
            ),
            BoxShadow(
              offset: Offset(0, 2.h),
              color: const Color(0x1F18274B),
              blurRadius: 6.r,
              spreadRadius: -4.r,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    showImage
                        ? _Image(coupon: coupon)
                        : const SizedBox.shrink(),
                    _Body(coupon: coupon),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: 1.w,
                height: 56.h,
                child: DottedLine(
                  direction: Axis.vertical,
                  dashColor: ColorUtils.borderColor,
                ),
              ),
            ),
            Container(
              width: halfCircleRightOffset + circleRadius / 2,
              alignment: Alignment.center,
              child: Selector<IBasketViewModel, bool>(
                selector: (_, vm) => vm.selectedCoupon == coupon,
                builder: (_, isSelected, __) => GestureDetector(
                  onTap: () {
                    context
                        .read<IBasketViewModel>()
                        .onSelectOrRemoveCouponPressed(coupon);
                  },
                  child: Text(
                    isSelected ? Strings.cancel.tr : Strings.select.tr,
                    style: TextStyleUtils.body.copyWith(
                      color: ColorUtils.primaryRedColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.coupon,
  }) : super(key: key);

  final CouponUIModel coupon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            coupon.title,
            style: TextStyleUtils.body,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            AppTranslation.translateTemplate(
              Strings.expiry,
              {'date': coupon.expiredDate.toDateString(type: "dd.MM.yyyy")},
            ),
            style: TextStyleUtils.footnote.copyWith(color: ColorUtils.black60),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.coupon,
  }) : super(key: key);

  final CouponUIModel coupon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Image.asset(coupon.imageUrl, width: 44.r, height: 44.r),
    );
  }
}

class CouponCardClipper extends CustomClipper<Path> {
  final double right;
  final double holeRadius;

  CouponCardClipper({required this.right, required this.holeRadius});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: const Radius.circular(1),
      );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CouponCardClipper oldClipper) => true;
}
