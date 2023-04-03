import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_3s_mart_app/translation/app_translation.dart';

class LanguageButton extends StatefulWidget {
  @override
  _LanguageButtonState createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          AppTranslation.switchLanguage();
          setState(() {});
        },
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          alignment: Alignment.center,
          child: Text(
            AppTranslation.currentLanguageCode == AppTranslation.LANG_CODE_VI
                ? 'VI'
                : 'EN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
