import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_3s_mart_app/global/global_data.dart';
import 'package:project_3s_mart_app/global/locator.dart';
import 'package:project_3s_mart_app/ui/utils/rlog.dart';

class LoggerUtils {
  static var _globalData = locator<GlobalData>();
  static Future initLogger() async {
    //path: '/storage/emulated/0/Android/data/com.ecr.ecr_handheld_app_v2/files/Log.txt'
    var storage = await getApplicationDocumentsDirectory();
    RLogger.initLogger(
      tag: 'Warning',
      isWriteFile: true,
      filePath: storage.path.toString() + "/",
    );
  }

  static Future logException(dynamic e) async {
    // if (RLogger.instance == null) await initLogger();
    // if (e is Exception) {
    //   String url = '';
    //   String error = '';
    //   try {
    //     if (e is DioError) {
    //       url = '\n URL: ' + e.requestOptions.baseUrl + e.requestOptions.path;
    //       error = '\n Details: ' + e.response!.data['errors'].toString();
    //     }
    //   } catch (e) {}
    //   await RLogger.instance
    //       ?.e(url + error, e, StackTrace.current, isWriteFile: true);
    // } else {
    //   await RLogger.instance?.e('', e, StackTrace.current, isWriteFile: true);
    // }
  }

  static Future logError(String msg) async {
    // if (RLogger.instance == null) await initLogger();
    // await RLogger.instance?.i('\n' + msg, tag: 'Error', isWriteFile: true);
  }

  static Future logWaring(String msg) async {
    // if (_globalData.logLevel != 'Error') {
    //   if (RLogger.instance == null) await initLogger();
    //   await RLogger.instance?.i('\n' + msg, tag: 'Warning', isWriteFile: true);
    // }
  }

  static Future logInfo(String msg) async {
    // if (_globalData.logLevel == 'Info') {
    //   if (RLogger.instance == null) await initLogger();
    //   await RLogger.instance?.i('\n' + msg, tag: 'Info', isWriteFile: true);
    // }
  }
}
