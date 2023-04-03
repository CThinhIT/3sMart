part of '../order_info_step2_screen.dart';

class _InfomationOrders extends StatelessWidget {
  const _InfomationOrders({
    required this.purchaseMethod,
    Key? key,
  }) : super(key: key);
  final PurchaseMethod purchaseMethod;

  @override
  Widget build(BuildContext context) {
    return Consumer<IOrderInfoViewModel>(builder: (_, _viewModel, __) {
      var address = _viewModel.deliveryAddressSelected;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoOrderItem(
            titleInfo: Strings.deliveryAddress.tr,
            subInfo:
                '${address.address}, ${address.ward}, ${address.district}, ${address.province}',
          ),
          InfoOrderItem(
            titleInfo: Strings.shippingOption.tr,
            subInfo: _viewModel.deliverymethodSelected.tr,
          ),
          InfoOrderItem(
            titleInfo: Strings.recipient.tr,
            subInfo: _viewModel.fullName,
            subInfo2: _viewModel.phoneNumber.replaceAllMapped(
                RegExp(r'(\d{3})(\d{3})(\d+)'),
                (Match m) => "${m[1]} ${m[2]} ${m[3]}"),
          ),
          Divider(
            thickness: 1.h,
            height: 0.h,
            color: ColorUtils.divider,
          ),
          Note(note: _viewModel.note),
        ],
      );
    });
  }
}
