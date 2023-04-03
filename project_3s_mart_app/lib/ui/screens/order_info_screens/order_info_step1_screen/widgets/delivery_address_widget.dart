part of '../order_info_step1_screen.dart';

class _DeliveryAddress extends StatelessWidget {
  const _DeliveryAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.deliveryAddress.tr,
            style: TextStyleUtils.title
                .copyWith(color: ColorUtils.primaryBlackColor),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                ),
                builder: (context) => const NewDeliveryAddress(),
              );
            },
            btnColor: ColorUtils.grey,
            height: 44.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.add,
                  size: 14.sp,
                  color: ColorUtils.primaryBlackColor,
                ),
                SizedBox(
                  width: 13.w,
                ),
                Text(
                  Strings.newDeliveryAddress.tr,
                  style: TextStyleUtils.button.copyWith(
                    color: ColorUtils.black86,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Consumer2<IMyAddressViewModel, IOrderInfoViewModel>(
              builder: (_, _myAddressViewModel, _orderInfoViewModel, __) {
            return Selector<IOrderInfoViewModel, DeliveryAddressUIModel>(
              selector: (_, __) => _orderInfoViewModel.deliveryAddressSelected,
              builder: (_, __, ___) {
                return Container(
                  constraints: BoxConstraints(maxHeight: 90.h),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ..._myAddressViewModel.listDeliveryAddressInDb.map(
                        (e) {
                          bool active = e.id ==
                              _orderInfoViewModel.deliveryAddressSelected.id;
                          String deliveryAddress =
                              "${e.address}, ${e.ward}, ${e.district}, ${e.province}";
                          return Padding(
                            padding: const EdgeInsets.all(2),
                            child: ButtonBorderWithDot(
                              btnHeight: 40.h,
                              onPressed: () {
                                _orderInfoViewModel.deliveryAddressSelected = e;
                              },
                              active: active,
                              child: Expanded(
                                child: Text(
                                  deliveryAddress,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: TextStyleUtils.subHeading2.copyWith(
                                    color: ColorUtils.primaryBlackColor,
                                    fontWeight: active
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          })
        ],
      ),
    );
  }
}
