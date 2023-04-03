import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/ui_models/product_ui_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

abstract class IScanViewModel implements ChangeNotifier {
  bool get isFlashOn;
  bool get isBackCamera;
  bool get isScanning;
  String? get scannedProductId;

  Future<void> ensureCameraPermission();
  void onQRViewCreated(QRViewController controller);
  Future<void> onOnOffFlashPressed();
  Future<void> onSwitchCameraPressed();
  Future<void> reScan();
  Future<void> stopScan();
  Future<void> pauseScan();
  Future<void> resumeScan();
}
