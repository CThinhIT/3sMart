import 'package:project_3s_mart_app/core/ui_models/voucher_ui_model.dart';

class CoinVoucherUIModel {
  final VoucherUIModel voucher;
  final int remainingVouchers;
  int coins;

  CoinVoucherUIModel({
    required this.voucher,
    required this.coins,
    required this.remainingVouchers,
  });

  static final fakeList = VoucherUIModel.fakeList
      .map((e) => CoinVoucherUIModel(voucher: e, coins: 109, remainingVouchers: 20))
      .toList();
}
