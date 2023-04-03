import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

import 'translation_text.dart';

/// App bar that is used for most of screens
class CustomAppBar extends PreferredSize {
  // ignore: use_key_in_widget_constructors
  CustomAppBar(
    AppBarOption option,
  ) : super(
          child: _buildCustomAppBar(option),
          preferredSize: Size.fromHeight(48.h),
        );

  static Widget _buildCustomAppBar(AppBarOption option) {
    return AppBar(
      backgroundColor: option.color,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: option.color,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      titleTextStyle: TextStyleUtils.heading3.copyWith(
        color: option.titleColor,
      ),
      actions: option.actions ??
          [
            option.isCancelEnabled
                ? TextButton(
                    onPressed: option.onCancelPressed,
                    child: TranslationText(
                      Strings.cancel,
                      style: TextStyleUtils.button.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
      title: Text(
        option.title,
      ),
      centerTitle: true,
      leading: option.isBackEnabled
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: option.backIconColor,
              ),
              onPressed: option.isBackEnabled ? option.onBackPressed : null,
            )
          : const SizedBox.shrink(),
    );
  }
}

class AppBarOption {
  final bool isBackEnabled;
  final bool isCancelEnabled;
  final Function() onBackPressed;
  final Function() onCancelPressed;
  final String title;
  final Color color;
  final Color titleColor;
  final Color backIconColor;
  final List<Widget>? actions;

  AppBarOption({
    required this.title,
    this.color = ColorUtils.primaryRedColor,
    this.titleColor = Colors.white,
    this.backIconColor = Colors.white,
    this.isBackEnabled = true,
    this.isCancelEnabled = false,
    this.actions,
    Function()? onBackPressed,
    Function()? onCancelPressed,
  })  : onBackPressed = onBackPressed ?? Get.back,
        onCancelPressed = onBackPressed ?? Get.back;
}
