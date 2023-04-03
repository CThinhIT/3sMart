import 'package:flutter/cupertino.dart';
import 'package:project_3s_mart_app/core/ui_models/order_ui_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iorders_management_viewmodel.dart';

class OrdersManagementViewModel with ChangeNotifier implements IOrdersManagementViewModel{
  @override
  List<OrderUIModel> get listOrders => OrderUIModel.listOrdersDemo;
  
}