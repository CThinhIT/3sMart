part of '../order_info_step1_screen.dart';

class _BodyOfDraggableForDeliveryTime extends StatelessWidget {
  const _BodyOfDraggableForDeliveryTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 5.h),
            height: 40.h,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    Strings.deliveryTime.tr,
                    textAlign: TextAlign.center,
                    style: TextStyleUtils.body
                        .copyWith(color: ColorUtils.primaryBlackColor),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _BuildButtonStandarDelivery(),
                SizedBox(
                  height: 16.h,
                ),
                const _BuildButtonDeliveryImmediately(),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.estimated.tr + ': ',
                          style: TextStyleUtils.body.copyWith(
                            color: ColorUtils.black60,
                          ),
                        ),
                        Text(
                          Strings.within2hour.tr,
                          style: TextStyleUtils.bodyStrong.copyWith(
                            color: ColorUtils.primaryRedColor,
                          ),
                        )
                      ],
                    ),
                    CustomButton(
                      onPressed: () {
                        //TODO
                        Get.back();
                      },
                      height: 44.h,
                      minWidth: 200.w,
                      btnColor: ColorUtils.primaryRedColor,
                      child: Text(
                        Strings.apply.tr,
                        style: TextStyleUtils.button.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildButtonStandarDelivery extends StatelessWidget {
  const _BuildButtonStandarDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewmodel = context.read<IOrderInfoViewModel>();

    return Selector<IOrderInfoViewModel, int>(
      selector: (_, __) => viewmodel.deliverymethodSelected.length,
      builder: (_, __, ___) {
        bool active =
            viewmodel.deliverymethodSelected == Strings.standardDelivery;
        return ButtonBorderWithDot(
          onPressed: () {
            viewmodel.deliverymethodSelected = Strings.standardDelivery;
          },
          active: active,
          btnHeight: 40.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200.w,
                child: Row(
                  children: [
                    Text(
                      Strings.standardDelivery.tr,
                      style: TextStyleUtils.button.copyWith(
                        fontWeight: active ? FontWeight.w700 : FontWeight.w400,
                        color: ColorUtils.primaryBlackColor,
                      ),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    InkWell(
                      onTap: () {
                        //TOD
                      },
                      child: Image.asset(
                        'assets/images/question.png',
                        height: 16.h,
                        width: 16.w,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BuildButtonDeliveryImmediately extends StatelessWidget {
  const _BuildButtonDeliveryImmediately({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewmodel = context.read<IOrderInfoViewModel>();
    return Selector<IOrderInfoViewModel, int>(
      selector: (_, __) => viewmodel.deliverymethodSelected.length,
      builder: (_, __, ___) {
        bool active =
            viewmodel.deliverymethodSelected == Strings.deliveryImmediately;
        return ButtonBorderWithDot(
          onPressed: () {
            viewmodel.deliverymethodSelected = Strings.deliveryImmediately;
          },
          active: active,
          btnHeight: 40.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200.w,
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/quickly.png',
                          height: 16.h,
                          width: 16.w,
                          fit: BoxFit.contain,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 3.w,
                            right: 3.w,
                          ),
                          child: Text(
                            Strings.deliveryImmediately.tr,
                            style: TextStyleUtils.button.copyWith(
                              fontWeight:
                                  active ? FontWeight.w700 : FontWeight.w400,
                              color: ColorUtils.primaryBlackColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/quickly.png',
                          height: 16.h,
                          width: 16.w,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    InkWell(
                      onTap: () {
                        //TODO
                      },
                      child: Image.asset(
                        'assets/images/question.png',
                        height: 16.h,
                        width: 16.w,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
