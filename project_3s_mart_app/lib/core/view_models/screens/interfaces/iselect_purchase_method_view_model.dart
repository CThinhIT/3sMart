import 'package:flutter/material.dart';

abstract class ISelectPurchaseMethodViewModel implements ChangeNotifier {
  bool get isOnlineShoppingMethodEnabled;
  bool get isScanAndGoMethodEnabled;
}
