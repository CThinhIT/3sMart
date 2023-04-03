import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/logger_utils.dart';
import 'package:project_3s_mart_app/global/app_text.dart';

import 'dialog_utils.dart';

class DoAndRetryUtil {
  static Future<bool> makeAction(Future<ActionResult> Function() action) async {
    if (action == null) return false;

    bool retry = false;
    bool result = false;
    try {
      do {
        var result = await action();
        if (result.success == false) {
          await DialogUtils.showYesNoDialog(
              title: result.title,
              body: result.message,
              onYes: () {
                retry = true;
                Get.back();
              },
              onNo: () {
                retry = false;
                Get.back();
              });
        } else {
          retry = false;
        }
      } while (retry == true);
      return result;
    } catch (e) {
      await LoggerUtils.logException(e);
      return false;
    }
  }
}

class ActionResult {
  bool success;
  //if not success, it will show a dialog with below content
  String title;
  String message;

  ActionResult(
      {required this.success, this.title = AppText.lblWarning, this.message = ''});
}
