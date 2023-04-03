import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iscan_viewmodel.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanViewModel extends ChangeNotifier implements IScanViewModel {
  StreamSubscription? scanDataSubscription;
  late QRViewController scannerController;

  var _isScanning = true;
  @override
  bool get isScanning => _isScanning;

  var _isBackCamera = true;
  @override
  bool get isBackCamera => _isBackCamera;

  var _isFlashOn = false;
  @override
  bool get isFlashOn => _isFlashOn;

  String? _scannedProductId;
  @override
  String? get scannedProductId => _scannedProductId;
  
  @override
  Future<void> ensureCameraPermission() async {
    if (await Permission.camera.isDenied) {
      Permission.camera.request();
    }
  }

  @override
  void onQRViewCreated(controller) {
    scannerController = controller;
    _isScanning = true;
    listenScanData();
    notifyListeners();
  }

  void listenScanData() {
    scanDataSubscription =
        scannerController.scannedDataStream.listen((barcode) async {
      log(barcode.code??'');
      _scannedProductId = barcode.code;
      await pauseScan();
    });
  }

  Future<void> cancelListeningScanData() async {
    scanDataSubscription?.cancel();
  }

  @override
  Future<void> pauseScan() async {
    _isScanning = false;
    notifyListeners();
    await scannerController.pauseCamera();
  }

  @override
  Future<void> resumeScan() async {
    _isScanning = true;
    notifyListeners();
    await scannerController.resumeCamera();
  }

  @override
  Future<void> onOnOffFlashPressed() async {
    /// TODO: Handle camera flash exception
    await scannerController.toggleFlash();
    _isFlashOn = !_isFlashOn;
    notifyListeners();
  }

  @override
  Future<void> onSwitchCameraPressed() async {
    /// TODO: Handle camera turning exception
    await scannerController.flipCamera();
    _isBackCamera = !_isBackCamera;
    notifyListeners();
  }

  @override
  Future<void> reScan() async {
    _scannedProductId = null;
    await resumeScan();
  }

  @override
  Future<void> stopScan() async {
    await cancelListeningScanData();
    scannerController.dispose();
    _scannedProductId = null;
    _isScanning = false;
    notifyListeners();
  }
}
