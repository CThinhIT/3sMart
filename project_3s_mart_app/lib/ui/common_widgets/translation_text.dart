import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_3s_mart_app/translation/app_translation.dart';

/// Text that displays text translated based on config in [AppTranslation]
class TranslationText extends StatelessWidget {
  /// Translation string name, it must be in [Strings]
  final String stringName;
  final TextAlign? textAlign;

  /// Contains params to translate a string template
  /// String template e.x: 'You bought {quantiy} {productName} {mintues} ago'
  ///
  /// see [AppTranslation.translateTemplate]
  final Map<String, String>? stringParams;

  final TextStyle? style;

  const TranslationText(this.stringName,
      {Key? key, this.style, this.stringParams, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        stringParams != null
            ? AppTranslation.translateTemplate(stringName, stringParams!)
            : stringName.tr,
        textAlign: textAlign,
        style: style);
  }
}
