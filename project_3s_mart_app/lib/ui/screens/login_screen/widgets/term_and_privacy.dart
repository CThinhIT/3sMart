import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/core/utils/color_utils.dart';
import 'package:project_3s_mart_app/core/utils/text_style_utils.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class TermAndPrivacy extends StatelessWidget {
  const TermAndPrivacy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: Strings.lblDescriptionRequest.tr,
            style: TextStyleUtils.footnote.copyWith(
              color: ColorUtils.black40,
            ),
          ),
          TextSpan(
            text: ' ' + Strings.lblTermsOfService.tr,
            style: TextStyleUtils.footnote.copyWith(
              color: ColorUtils.primaryRedColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //TODO
              },
          ),
          TextSpan(
              text: ' ' + Strings.lblAnd.tr,
              style: TextStyleUtils.footnote.copyWith(
                color: ColorUtils.black40,
              )),
          TextSpan(
            text: ' ' + Strings.lblPrivacyPolicy.tr,
            style: TextStyleUtils.footnote.copyWith(
              color: ColorUtils.primaryRedColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //TODO
              },
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
