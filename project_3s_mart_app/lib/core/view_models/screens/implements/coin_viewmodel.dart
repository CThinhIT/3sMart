import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/ui_models/coin_redeeming_category_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/coin_voucher_ui_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/icoin_viewmodel.dart';

class CoinViewModel extends ChangeNotifier implements ICoinViewModel {
  @override
  // TODO:
  get bannerImageUrls => [
    'assets/images/tmp_coin_banner1.png', 
    'assets/images/tmp_coin_banner2.png', 
    'assets/images/tmp_coin_banner3.png', 
  ];

  @override
  // TODO:
  int get availableCoins => 500;

  @override
  // TODO:
  List<CoinRedeemingCategoryUIModel> get coinRedeemingCategories => CoinRedeemingCategoryUIModel.fakeList;

  @override
  // TODO: 
  List<CoinVoucherUIModel> get coinVouchers => CoinVoucherUIModel.fakeList;
}
