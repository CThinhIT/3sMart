part of "../scan_and_go_cart_screen.dart";

class _CartAddItemBtn extends StatelessWidget {
  const _CartAddItemBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            //color: Color(0xFF1F4C84),
            width: 116.w,
            height: 40.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/ic_add_cart.svg",
                  width: 116.w,
                  height: 40.w,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 14.h),
                  child: Text(
                    Strings.moreProducts.tr,
                    style: TextStyleUtils.button.copyWith(
                      color: ColorUtils.black86,
                    ),
                  ),
                ),
              ],
            ),
          ),
          RippleClickEffect(
            onPressed: () {
              Get.toNamed(MyRouter.scan);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 49.w,
                  height: 49.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFDA44),
                    shape: BoxShape.circle,
                  ),
                ),
                SvgPicture.asset(
                  "assets/images/ic_scan_add.svg",
                  width: 24.w,
                  height: 24.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
