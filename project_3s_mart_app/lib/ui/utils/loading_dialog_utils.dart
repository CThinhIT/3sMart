import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoadingDialogUtils {
  static SimpleFontelicoProgressDialog? _progressDialog;

  /// show loading and return the dialog
  static void showLoading({String message = Strings.pleaseWait,}) {
    if (_progressDialog != null) return;
    _progressDialog = SimpleFontelicoProgressDialog(
        context: Get.overlayContext, barrierDimisable: false);
    _progressDialog!.show(
      message: message.tr,
      horizontal: true,
      width: 250.w,
      height: 75.0,
      separation: 30.w,
      textStyle: TextStyleUtils.body,
    );
  }

  static void hideLoading() {
    try {
      _progressDialog!.hide();
      _progressDialog = null;
    } catch (e) {}
  }
}
