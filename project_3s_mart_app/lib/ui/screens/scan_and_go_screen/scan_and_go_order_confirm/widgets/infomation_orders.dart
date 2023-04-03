part of '../scan_and_go_order_confirm_screen.dart';

class _InfomationOrders extends StatelessWidget {
  const _InfomationOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IOrderInfoViewModel>(builder: (_, _viewModel, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoOrderItem(
            titleInfo: Strings.receivedTime.tr,
            subInfo: DateFormat("HH:mm, dd/MM/yyyy").format(DateTime.now()),
          ),
          InfoOrderItem(
            titleInfo: Strings.recipient.tr,
            subInfo: _viewModel.fullName,
            subInfo2: _viewModel.phoneNumber,
          ),
          Note(note: _viewModel.note),
        ],
      );
    });
  }
}
