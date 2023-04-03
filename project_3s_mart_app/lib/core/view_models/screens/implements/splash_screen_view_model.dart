import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:project_3s_mart_app/core/services/interfaces/iappstrore_service.dart';
import 'package:project_3s_mart_app/core/services/interfaces/isession_service.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/isplash_screen_view_model.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/global/router.dart';

class SplashScreenViewModel extends ChangeNotifier
    implements ISplashScreenViewModel {
  final LocalAuthentication _auth = LocalAuthentication();
  ISessionService sessionService = locator<ISessionService>();
  IAppStorageService appStorageService = locator<IAppStorageService>();

  @override
  Future<void> goToNextPage() async {
    var session = sessionService.getSession();
    var appStorage = await appStorageService.getAppStorage();
    if (!appStorage.isWelcome) {
      await appStorageService.setWelcome(true);
      Get.offAllNamed(MyRouter.carouselSlider);
    } else {
      if (session != null) {
        if (!appStorage.isFingerprint ||
            !(await _auth.canCheckBiometrics) ||
            !(await _auth.isDeviceSupported())) {
          Get.offAllNamed(MyRouter.selectPurchaseMethod);
        } else {
          Get.offAllNamed(MyRouter.finerPrintLogin);
        }
      } else {
        Get.offAllNamed(MyRouter.login);
      }
    }
  }
}
