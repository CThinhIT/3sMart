import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';

import 'custom_button.dart';

part 'custom_dialog_simple_yes_no.dart';

class CustomDialogActionButton {
  final VoidCallback? onPressed;
  final Color btnColor;
  final Color textColor;
  final String text;
  final bool isContinue;

  CustomDialogActionButton({
    this.onPressed,
    this.btnColor = ColorUtils.primaryRedColor,
    this.textColor = Colors.white,
    this.text = '',
    this.isContinue = false,
  });
}

class CustomDialog extends StatelessWidget {
  final String titleText;
  final Widget? content;
  final List<CustomDialogActionButton> actionButtons;

  const CustomDialog({
    Key? key,
    this.titleText = '',
    this.content,
    this.actionButtons = const [],
  }) : super(key: key);

  List<Widget> _buildActionButtons() {
    return actionButtons.map((actionButton) {
      return Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 0, 10),
        width: actionButton.isContinue ? 230 : 100,
        child: CustomButton(
          height: 33,
          onPressed: actionButton.onPressed,
          btnColor: actionButton.btnColor,
          textColor: actionButton.textColor,
          child: Text(
            actionButton.text,
            style: TextStyleUtils.button,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AlertDialog(
        title: Text(
          titleText,
          style: TextStyleUtils.heading3.copyWith(
            color: ColorUtils.primaryRedColor,
            fontSize: 17.sp,
          ),
        ),
        content: content,
        actions: <Widget>[
          ..._buildActionButtons(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
