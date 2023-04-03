import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/ui_models/branch_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/voucher_ui_model.dart';

abstract class IVoucherViewModel implements ChangeNotifier {
  List<BranchUIModel> get allStores;
  List<BranchUIModel> get nearbyStores;
  List<BranchUIModel> get otherStores;
  List<VoucherUIModel> get myVouchers;
  List<VoucherUIModel> get hotVouchers;
  Future<void> initStoreList(List<BranchUIModel> stores);
}
