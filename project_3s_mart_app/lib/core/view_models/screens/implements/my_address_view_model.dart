import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/delivery_address_entity.dart';
import 'package:project_3s_mart_app/core/services/interfaces/idelivery_address_service.dart';
import 'package:project_3s_mart_app/core/ui_models/delivery_address_ui_model.dart';
import 'package:project_3s_mart_app/core/ui_models/location_model.dart';
import 'package:project_3s_mart_app/core/utils/list_extension.dart';
import 'package:project_3s_mart_app/core/utils/string_extension.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/imy_address_view_model.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/ui/utils/loading_dialog_utils.dart';

class MyAddressViewModel extends ChangeNotifier implements IMyAddressViewModel {
  final _deliveryAddressService = locator<IDeliveryAddressService>();
  bool _isProvinceFocused = false;
  @override
  bool get isProvinceFocused => _isProvinceFocused;
  @override
  set isProvinceFocused(bool value) {
    _isProvinceFocused = value;
    notifyListeners();
  }

  bool _isDistrictFocused = false;
  @override
  bool get isDistrictFocused => _isDistrictFocused;
  @override
  set isDistrictFocused(bool value) {
    _isDistrictFocused = value;
    notifyListeners();
  }

  bool _isWardFocused = false;
  @override
  bool get isWardFocused => _isWardFocused;
  @override
  set isWardFocused(bool value) {
    _isWardFocused = value;
    notifyListeners();
  }

  WardModel _currentWard = WardModel();
  @override
  WardModel get currentWard => _currentWard;
  @override
  set currentWard(WardModel value) {
    _currentWard = value;
    notifyListeners();
  }

  ProvinceModel _currentProvince = ProvinceModel();
  @override
  ProvinceModel get currentProvince => _currentProvince;
  @override
  set currentProvince(ProvinceModel value) {
    _currentProvince = value;
    _isDistrictFocused = false;
    _isWardFocused = false;
    _currentDistrict.name = '';
    _currentWard.name = '';
    notifyListeners();
  }

  DistrictModel _currentDistrict = DistrictModel();
  @override
  DistrictModel get currentDistrict => _currentDistrict;
  @override
  set currentDistrict(DistrictModel value) {
    _currentDistrict = value;
    _isWardFocused = false;
    _currentWard.name = '';
    notifyListeners();
  }

  final List<ProvinceModel> _listLocations = [];
  @override
  List<ProvinceModel> get listLocations => _listLocations;
  @override
  Future<void> getListLocation() async {
    _listLocations.clear();
    String data = await rootBundle.loadString("assets/jsons/local.json");
    var localJson = json.decode(data);
    for (var json in localJson) {
      _listLocations.add(ProvinceModel.fromJson(json));
    }
  }

  @override
  void init({
    String? nameProvince,
    String? nameDistrict,
    String? nameWard,
  }) {
    var province = _listLocations.firstOrDefault((x) => x.name == nameProvince);
    var district =
        province?.districts?.firstOrDefault((x) => x.name == nameDistrict);
    var wards = district?.wards?.firstOrDefault((x) => x.name == nameWard);
    _currentProvince = province ?? ProvinceModel(name: nameProvince ?? '');
    _currentDistrict = district ?? DistrictModel(name: nameDistrict ?? '');
    _currentWard = wards ?? WardModel(name: nameWard ?? '');
    notifyListeners();
  }

  @override
  Future<void> updateAddress(DeliveryAddressEntity address) async {
    await _deliveryAddressService.updateDeliveryAddress(address);
    getAllDeliveryAddressInDB();
  }

  @override
  bool isSelectedAddress() {
    if (!_currentProvince.name.isNullOrEmpty() &&
        !_currentDistrict.name.isNullOrEmpty() &&
        !_currentWard.name.isNullOrEmpty()) {
      return true;
    }
    return false;
  }

  @override
  Future<void> addAddress(DeliveryAddressEntity address) async {
    await _deliveryAddressService.insertDeliveryAddress(address);
    getAllDeliveryAddressInDB();
  }

  int _listenerDeliveryAddress = 0;
  @override
  int get listenerDeliveryAddress => _listenerDeliveryAddress;

  void _notifyDeliveryAddress() {
    _listenerDeliveryAddress++;
    notifyListeners();
  }

  List<DeliveryAddressUIModel> _listDeliveryAddressInDb = [];

  @override
  List<DeliveryAddressUIModel> get listDeliveryAddressInDb =>
      _listDeliveryAddressInDb;
  @override
  void getAllDeliveryAddressInDB() {
    _listDeliveryAddressInDb =
        _deliveryAddressService.getAllDeliveryAddress().map((e) {
      return DeliveryAddressUIModel.fromEntities(e);
    }).toList();
    _notifyDeliveryAddress();
  }

  @override
  Future<void> deleteAddress(String id) async {
    LoadingDialogUtils.showLoading();
    await _deliveryAddressService.deleteDeliveryAddress(id);
    getAllDeliveryAddressInDB();
    LoadingDialogUtils.hideLoading();
  }
}
