import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/delivery_address_entity.dart';
import 'package:project_3s_mart_app/core/ui_models/delivery_address_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/location_model.dart';

abstract class IMyAddressViewModel implements ChangeNotifier {
  Future<void> updateAddress(DeliveryAddressEntity address);
  List<ProvinceModel> get listLocations;
  Future<void> getListLocation();
  void init({
    String? nameProvince,
    String? nameDistrict,
    String? nameWard,
  });
  late bool isProvinceFocused;
  late bool isDistrictFocused;
  late bool isWardFocused;
  late ProvinceModel currentProvince;
  late DistrictModel currentDistrict;
  late WardModel currentWard;
  Future<void> addAddress(DeliveryAddressEntity address);
  bool isSelectedAddress();
  Future<void> deleteAddress(String id);
  void getAllDeliveryAddressInDB();
  List<DeliveryAddressUIModel> get listDeliveryAddressInDb;
  int get listenerDeliveryAddress;
}
