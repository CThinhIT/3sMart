import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/global/app_text.dart';
import 'package:project_3s_mart_app/translation/strings.dart';
import 'package:project_3s_mart_app/ui/common_widgets/custom_dialog.dart';

import 'localization_utils.dart';

class DialogUtils {
  static Future<void> showYesNoDialog({
    required String title,
    required VoidCallback onYes,
    String? body,
    VoidCallback? onNo,
    bool barrierDismissible = false,
  }) async {
    onNo = onNo ?? Get.back;

    await Get.dialog(AlertDialog(
      title: Text(title),
      content: body != null ? Text(body) : null,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: Colors.black,
      ),
      contentTextStyle: TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      titlePadding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 8.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      actionsPadding: EdgeInsets.all(8.r),
      actions: [
        ElevatedButton(
          onPressed: onNo,
          child: Text(
            Strings.no.tr,
            style: TextStyleUtils.button.copyWith(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            minimumSize: Size(72.w, 36.h),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
            onYes();
          },
          child: Text(
            Strings.yes.tr,
            style: TextStyleUtils.button.copyWith(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(72.w, 36.h),
            primary: ColorUtils.primaryRedColor,
          ),
        ),
      ],
    ));
  }

  static Future<void> showOkCancelDialog({
    String? title,
    String? body,
    VoidCallback? onOK,
    VoidCallback? onCancel,
    bool barrierDismissible = false,
  }) async {
    onOK = onOK ?? () => {Get.back()};
    onCancel = onCancel ?? () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: translations.textStatic(title ?? ""),
        bodyText: translations.textStatic(body ?? ""),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.grey[700]!,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblCancel),
            onPressed: onCancel,
          ),
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblOK),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showOkDialog({
    String? title,
    String? body,
    VoidCallback? onOK,
    bool barrierDismissible = false,
  }) async {
    onOK ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: title ?? "",
        bodyText: body ?? "",
        actionButtons: [
          CustomDialogActionButton(
            btnColor: ColorUtils.primaryRedColor,
            textColor: Colors.white,
            text: Strings.confirm.tr,
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showRetryDialog({
    String? title,
    String? body,
    VoidCallback? onRetry,
    bool barrierDismissible = false,
  }) async {
    onRetry ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: translations.textStatic(title ?? ""),
        bodyText: translations.textStatic(body ?? ""),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic('Retry'),
            onPressed: onRetry,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showContinueDialog({
    String? title,
    String? body,
    VoidCallback? onOK,
    bool barrierDismissible = false,
  }) async {
    onOK ??= () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: translations.textStatic(title ?? ""),
        bodyText: translations.textStatic(body ?? ""),
        actionButtons: [
          CustomDialogActionButton(
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblContinue),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showContinueGoBackDialog({
    String? title,
    String? body,
    VoidCallback? onOK,
    VoidCallback? onCancel,
    bool barrierDismissible = false,
  }) async {
    onOK = onOK ?? () => {Get.back()};
    onCancel = onCancel ?? () => {Get.back()};

    await Get.dialog(
      CustomDialogSimple(
        titleText: translations.textStatic(title ?? ""),
        bodyText: translations.textStatic(body ?? ""),
        actionButtons: [
          CustomDialogActionButton(
            isContinue: true,
            btnColor: Colors.grey[700]!,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblGoBack),
            onPressed: onCancel,
          ),
          CustomDialogActionButton(
            isContinue: true,
            btnColor: Colors.green,
            textColor: Colors.white,
            text: translations.textStatic(AppText.lblContinueAnyway),
            onPressed: onOK,
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }
}
