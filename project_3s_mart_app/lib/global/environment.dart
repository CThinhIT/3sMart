import 'dart:io';

import 'package:unique_identifier/unique_identifier.dart';

enum Environment { dev, prod }

class EnvironmentUtil {
  static late Map<String, dynamic> _config;

  static void setEnvironment(Environment env, Directory storage) async {
    switch (env) {
      case Environment.dev:
        await _initAndroidAppSetting(Environment.dev, storage);
        _config = _Config.devConfig;
        break;
      case Environment.prod:
        await _initAndroidAppSetting(Environment.prod, storage);
        _config = _Config.prodConfig;
        break;
    }
  }

  static Environment get currentEnv {
    return _config[_Config.current_env];
  }

  static String get apiURL {
    return _config[_Config.apiURL];
  }

  /// using only for windows
  static String get deviceSerial {
    return _config[_Config.deviceSerial];
  }

  static int get apiConnectTimeout {
    return _config[_Config.apiConnectTimeout];
  }

  /// seconds
  static int get backgroundSyncFrequency {
    return _config[_Config.backgroundSyncFrequency];
  }
}

class _Config {
  static const current_env = 'CURRENT_ENV';
  static const apiURL = 'BACKEND_API';
  static const deviceSerial = 'DEVICE_SERIAL';
  static const apiConnectTimeout = 'API_CONNECT_TIMEOUT';
  static const backgroundSyncFrequency = 'BACKGROUND_SYNC_FREQUENCY';

  static Map<String, dynamic> devConfig = {
    // current_env: Environment.dev,
    // // apiURL: 'https://uat-stock-bo-api.ecr-aws.co.uk/',
    // // handheldHardwareApiUrl: 'http://localhost:1234',
    // apiURL: 'https://uat-stock-lner-bo-api.ecr-aws.co.uk/',
    // handheldHardwareApiUrl: 'http://localhost:1234',
    // backgroundSyncFrequency: 600,
    // redCardPosId: 'MyPosId',
    // deviceSerial: '2057766',
    // apiConnectTimeout: 240000,
    // winBuildConfig: WinBuildConfig.release,
    // logLevel: 'Error'
  };

  static Map<String, dynamic> prodConfig = {
    // current_env: Environment.prod,
    // apiURL: 'https://uat-stock-lner-bo-api.ecr-aws.co.uk/',
    // apiConnectTimeout: 240000,
    // redCardPosId: 'MyPosId',
    // backgroundSyncFrequency: 600,
    // deviceSerial: '2057766',
    // winBuildConfig: WinBuildConfig.release,
    // logLevel: 'Error'
  };

  static Map<String, dynamic> winConfig = {};
}

Future<void> _initAndroidAppSetting(Environment env, Directory storage) async {
  final file = await File(storage.path + '/AppSetting.xml').existsSync();
  File fileAndroidAppSetting;
  String? defaultSerial;
  String defaultServerAddress = 'https://uat-stock-lner-bo-api.ecr-aws.co.uk/';

  try {
    if (env == Environment.prod) {
      defaultServerAddress = 'https://api-lner.ecr-aws.co.uk/';
      defaultSerial = await UniqueIdentifier.serial;
      if (defaultSerial == 'unknown') {
        defaultSerial = '2057766';
      }
    } else {
      defaultSerial = '220594';
    }
  } catch (e) {}

  if (env == Environment.dev) {
    _Config.devConfig = {
      _Config.current_env: env,
      _Config.apiURL: _fixUrl(defaultServerAddress),
      _Config.apiConnectTimeout: 240000,
      _Config.deviceSerial: defaultSerial,
      _Config.backgroundSyncFrequency: 600,
    };
  } else if (env == Environment.prod) {
    _Config.prodConfig = {
      _Config.current_env: env,
      _Config.apiURL: _fixUrl(defaultServerAddress),
      _Config.apiConnectTimeout: 240000,
      _Config.deviceSerial: defaultSerial,
      _Config.backgroundSyncFrequency: 600,
    };
  }
}

String _fixUrl(String url) {
  if (url.endsWith("/")) {
    return url.substring(0, url.length - 1);
  }
  return url;
}
