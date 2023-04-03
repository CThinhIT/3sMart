import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_3s_mart_app/core/api/rest_client.dart';
import 'package:project_3s_mart_app/core/hive_database/hive_database.dart';
import 'package:project_3s_mart_app/core/utils/logger_utils.dart';

import 'environment.dart';
import 'global_data.dart';
import 'locator_dao.dart';
import 'locator_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => HiveDatabase());
  locator.registerLazySingleton(() => GlobalData());
  bool isNewVersion = await _checkIsNewVersion();
  if (isNewVersion) {
    await _removeOldHive();
  }

  await locator<HiveDatabase>().init();

  if (Platform.isAndroid) {
    // await setDeviceSerial();
    locator<GlobalData>().deviceInfo.deviceSerial =
        EnvironmentUtil.deviceSerial;
    locator<GlobalData>().logLevel = 'Info';
  } else {
    locator<GlobalData>().deviceInfo.deviceSerial =
        EnvironmentUtil.deviceSerial;
  }
  setupRestClient();
  registerDaoSingletons(locator);
  registerServiceSingletons(locator);
}

Future<void> _removeOldHive() async {
  var permanentFolder = await getApplicationDocumentsDirectory();
  var hiveFolder = Directory(permanentFolder.path + '/hive');
  if (hiveFolder.existsSync()) hiveFolder.deleteSync(recursive: true);
}

Future<bool> _checkIsNewVersion() async {
  var permanentFolder = await getApplicationDocumentsDirectory();
  var currentVersion = (await PackageInfo.fromPlatform()).version;
  bool needToUpdateDB = false;
  try {
    var versionFile = File(permanentFolder.path + '/version.txt');
    if (versionFile.existsSync()) {
      var contents = await versionFile.readAsString();
      if (contents != currentVersion) {
        await versionFile.writeAsString(currentVersion); // write new version
      }
      return needToUpdateDB = contents != currentVersion;
    } else {
      await versionFile.writeAsString(currentVersion);
      return needToUpdateDB = false;
    }
  } catch (e) {
    await LoggerUtils.logException(e);
  }
  return needToUpdateDB;
}

void setupRestClient() {
  var dio = Dio();
  dio.options = BaseOptions(
    connectTimeout: 50000,
    receiveTimeout: EnvironmentUtil.apiConnectTimeout,
  );

  try {
    locator.registerLazySingleton(
      () => RestClient(dio, baseUrl: EnvironmentUtil.apiURL),
      instanceName: "RestClient",
    );
  } catch (e) {
    Future.wait([LoggerUtils.logException(e)]);
  }
}

RestClient getRestClient() {
  return locator.get<RestClient>(instanceName: 'RestClient');
}

Future<void> setDeviceSerial() async {
  String serial = '2057766';
  /*if (EnvironmentUtil.currentEnv == Environment.prod) {
    await AndroidMultipleIdentifier.requestPermission();
    serial = await AndroidMultipleIdentifier.serialCode;
    if (serial == 'unknown') {
      serial = '2057766';
    }
  } else {
    serial = '2057766';
  }*/

  locator<GlobalData>().deviceInfo.deviceSerial = serial;
}
