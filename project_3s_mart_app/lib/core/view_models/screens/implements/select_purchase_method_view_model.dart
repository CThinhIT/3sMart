import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iselect_purchase_method_view_model.dart';

class SelectPurchaseMethodViewModel extends ChangeNotifier
    implements ISelectPurchaseMethodViewModel {
  // TODO
  @override
  bool get isOnlineShoppingMethodEnabled => true;

  // TODO
  @override
  bool get isScanAndGoMethodEnabled => true;
}
