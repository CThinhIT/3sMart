
import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/ui_models/coin_redeeming_category_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/coin_voucher_ui_model.dart';

abstract class ICoinViewModel implements ChangeNotifier {
  List<String> get bannerImageUrls;
  List<CoinRedeemingCategoryUIModel> get coinRedeemingCategories;
  List<CoinVoucherUIModel> get coinVouchers;
  int get availableCoins;
}

