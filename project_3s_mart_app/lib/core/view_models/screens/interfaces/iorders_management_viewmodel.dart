import 'package:flutter/cupertino.dart';
import 'package:project_3s_mart_app/core/ui_models/order_ui_model.dart';

abstract class IOrdersManagementViewModel implements ChangeNotifier{
  List<OrderUIModel> get listOrders;
}