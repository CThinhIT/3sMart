part of '../coin_screen.dart';

class _CoinVoucherList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const _CoinVoucherList();

  @override
  Widget build(BuildContext context) {
    return Consumer<ICoinViewModel>(
      builder: (_, vm, __) {
        return ListView.separated(
          itemBuilder: (_, index) =>
              _CoinVoucherItem(coinVoucher: vm.coinVouchers[index]),
          separatorBuilder: (_, __) => SizedBox(height: 8.h),
          itemCount: vm.coinVouchers.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(16.r),
          physics: const NeverScrollableScrollPhysics(),
        );
      },
    );
  }
}

