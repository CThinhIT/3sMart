import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/session/session_entity.dart';
import 'package:project_3s_mart_app/core/services/interfaces/iappstrore_service.dart';
import 'package:project_3s_mart_app/core/services/interfaces/isession_service.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/iauth_viewmodel.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';
import 'package:project_3s_mart_app/translation/app_translation.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:project_3s_mart_app/ui/utils/dialog_utils.dart';

class AuthViewModel with ChangeNotifier implements IAuthViewModel {
  final LocalAuthentication _auth = LocalAuthentication();

  @override
  void switchLanguage() {
    AppTranslation.switchLanguage();
    notifyListeners();
  }

  IAppStorageService appStorageService = locator<IAppStorageService>();
  ISessionService sessionService = locator<ISessionService>();

  @override
  Future<bool> checkSupportFingerprint() async {
    List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();
    if (availableBiometrics.contains(BiometricType.fingerprint)) {
      return true;
    }
    return false;
  }

  @override
  Future<void> authenticate() async {
    try {
      AndroidAuthMessages androidAuthMessages = AndroidAuthMessages(
        signInTitle: '3S Mart',
        cancelButton: Strings.cancel.tr,
        biometricHint: Strings.authenticationHint.tr,
      );
      IOSAuthMessages iosAuthMessages = IOSAuthMessages(
        cancelButton: Strings.cancel.tr,
      );
      bool didAuthenticate = await _auth.authenticate(
        localizedReason: Strings.authentication.tr,
        biometricOnly: true,
        androidAuthStrings: androidAuthMessages,
        iOSAuthStrings: iosAuthMessages,
      );

      if (didAuthenticate) {
        await appStorageService.setFingerprint(true);
        Get.offAllNamed(MyRouter.selectPurchaseMethod);
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled ||
          e.code == auth_error.notAvailable) {
        var appStorage = await appStorageService.getAppStorage();
        if (!appStorage.isFingerprint) {
          await DialogUtils.showOkDialog(
            title: Strings.warning.tr,
            body: Strings.msgEnableFingerprint.tr,
          );
        } else {
          await appStorageService.setFingerprint(false);
          Get.offAllNamed(MyRouter.selectPurchaseMethod);
        }
      }
    }
  }

  @override
  Future<void> changeValueFingerprint(bool value) async {
    try {
      AndroidAuthMessages androidAuthMessages = AndroidAuthMessages(
        signInTitle: '3S Mart',
        cancelButton: Strings.cancel.tr,
        biometricHint: '',
      );
      IOSAuthMessages iosAuthMessages = IOSAuthMessages(
        cancelButton: Strings.cancel.tr,
      );
      bool didAuthenticate = await _auth.authenticate(
        localizedReason: Strings.authenticationHint.tr,
        biometricOnly: true,
        androidAuthStrings: androidAuthMessages,
        iOSAuthStrings: iosAuthMessages,
      );

      if (didAuthenticate) {
        await appStorageService.setFingerprint(value);
        _isActiveFingerprint = value;
        notifyListeners();
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled ||
          e.code == auth_error.notAvailable) {
        await DialogUtils.showOkDialog(
          title: Strings.warning.tr,
          body: Strings.msgEnableFingerprint.tr,
        );
      }
    }
  }

  @override
  Future<void> init() async {
    _isSupportFingerprint = await checkSupportFingerprint();
    notifyListeners();
    if (_isSupportFingerprint) {
      var appStorage = await appStorageService.getAppStorage();
      _isActiveFingerprint = appStorage.isFingerprint;
    }
  }

  @override
  Future<void> goToScreen() async {
    var appStorage = await appStorageService.getAppStorage();
    if (!(appStorage.isFingerprint)) {
      Get.offAllNamed(MyRouter.quickLogin);
    } else {
      Get.offAllNamed(MyRouter.selectPurchaseMethod);
    }
  }

  @override
  Future<bool> login() async {
    return true;
  }

  @override
  Future<void> logout() async {
    await sessionService.clear();
    Get.offAllNamed(MyRouter.login);
  }

  @override
  Future<bool> register() async {
    return true;
  }

  @override
  Future<bool> createSession(String phoneNumer) async {
    await sessionService.insert(
      SessionEntity(phoneNumer: phoneNumer),
    );
    return true;
  }

  @override
  bool get isActiveFingerprint => _isActiveFingerprint;

  late bool _isActiveFingerprint = false;

  late bool _isSupportFingerprint = false;
  @override
  bool get isSupportFingerprint => _isSupportFingerprint;
}
