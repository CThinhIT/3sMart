part of '../home_screen.dart';

class _AnimatedHeaderDelegate extends SliverPersistentHeaderDelegate {
  _AnimatedHeaderDelegate({
    required this.minExtent,
    required this.maxExtent,
    this.onTap,
    this.readOnly = false,
  });

  @override
  final double minExtent;
  @override
  final double maxExtent;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final shrinkRelative = shrinkOffset / (maxExtent - minExtent);
    var curvatureMultiplier = 1 - (shrinkRelative / 2);
    final _textController = TextEditingController();

    return Stack(
      children: [
        Container(
          height: 80.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorUtils.primaryRedColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(
                  curvatureMultiplier * 50.r, curvatureMultiplier * 14.r),
              bottomRight: Radius.elliptical(
                  curvatureMultiplier * 50.r, curvatureMultiplier * 14.r),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 16.w,
                top: 8.h,
                bottom: 8.h,
              ),
              child: HomeAppBar(
                leading: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: curvatureMultiplier,
                  child: Row(
                    children: [
                      RippleClickEffect(
                        onPressed: () {
                          Get.offAllNamed(MyRouter.selectPurchaseMethod);
                        },
                        borderRadius: BorderRadius.circular(16.r),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4.h),
                          child: Icon(
                            CupertinoIcons.back,
                            color: ColorUtils.white,
                            size: 25.r,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      const SelectSupertmarket(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Transform.translate(
          offset: Offset(0, (curvatureMultiplier * 48).h),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: (32 + curvatureMultiplier * 8).h,
            width: (255 + curvatureMultiplier * 83).w,
            margin: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 8.h,
              bottom: 8.h,
            ),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular((4 + curvatureMultiplier * 4).r),
              color: curvatureMultiplier > 0.7
                  ? const Color(0xFFECECEC)
                  : ColorUtils.white,
            ),
            child: TextFormField(
              readOnly: readOnly,
              onTap: onTap,
              controller: _textController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  gapPadding: 0,
                ),
                contentPadding: EdgeInsets.only(
                  right: 14.w,
                  left: 10.w,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 10.w,
                  ),
                  child: Icon(
                    CupertinoIcons.search,
                    size: 17.r,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  maxWidth: 40.w,
                  maxHeight: 24.h,
                ),
                hintText: Strings.hintSearch.tr,
                hintStyle: TextStyleUtils.subHeading.copyWith(
                  color: ColorUtils.black60,
                ),
              ),
              style: TextStyleUtils.subHeading,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(_AnimatedHeaderDelegate oldDelegate) {
    return false;
  }
}
