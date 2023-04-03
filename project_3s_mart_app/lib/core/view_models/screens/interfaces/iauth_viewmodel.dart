import 'package:flutter/cupertino.dart';

abstract class IAuthViewModel with ChangeNotifier {
  Future<void> authenticate();
  Future<void> changeValueFingerprint(bool value);
  Future<void> goToScreen();
  void switchLanguage();
  Future<bool> register();
  Future<bool> login();
  Future<void> logout();
  Future<bool> createSession(String phoneNumer);
  Future<bool> checkSupportFingerprint();
  Future<void> init();
  bool get isActiveFingerprint;
  bool get isSupportFingerprint;
}
