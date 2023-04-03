import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'en.dart';
import 'vi.dart';

/// Class contains language translation configurations
///
/// Use [changeLanguage] to change the current translation language
class AppTranslation extends Translations {
  static const LANG_CODE_EN = 'en';
  static const LANG_CODE_VI = 'vi';
  static const SUPPORTED_LOCALES = [
    Locale(LANG_CODE_VI, 'VN'),
    Locale(LANG_CODE_EN, 'US'),
  ];

  static String get currentLanguageCode => Get.locale!.languageCode;
  static String get currentLanguage => LANGUAGES[currentLanguageCode]!;

  /// map between language code to language
  static const LANGUAGES = {
    LANG_CODE_VI: 'Tiếng việt',
    LANG_CODE_EN: 'English'
  };



  /// Change current langage by [langCode]
  /// [langCode] must be [AppTranslation.LANG_CODE_VI] or [AppTranslation.LANG_CODE_EN]
  static void changeLanguage(String langCode) {
    var locale = AppTranslation._findSupportedLocale(langCode);
    assert(locale != null, 'Unsupport langage code ' + langCode);
    Get.updateLocale(locale!);
  }

  /// Return default locale
  ///
  /// Return the device's locale if it is in [SUPPORTED_LOCALES].
  /// Otherwise, return [SUPPORTED_LOCALES].first
  static Locale? getDefaultLocale() {
    final supportLocale = _findSupportedLocale(Get.deviceLocale!.languageCode);
    return supportLocale ?? SUPPORTED_LOCALES.first;
  }

  /// Find supported locale by [languageCode]
  static Locale? _findSupportedLocale(String languageCode) {
    final locales = SUPPORTED_LOCALES.where(
      (element) => element.languageCode == languageCode,
    );
    return locales.isNotEmpty ? locales.first : null;
  }

  static void switchLanguage() {
    if (currentLanguageCode == LANG_CODE_EN) {
      changeLanguage(LANG_CODE_VI);
    } else {
      changeLanguage(LANG_CODE_EN);
    }
  }

  /// Translate string template with [params]
  ///
  /// param [stringName] is name of translated string template and it's defiend in [Strings]
  /// param [params] is a map containing params to extract and replace into the translated string template
  ///
  /// Useage ex: translated stringTemplate = 'You bought {quantiy} {productName} {mintues} ago'
  /// -> To translate this temlate with params:
  ///         translateTemaplte(stringTemplate, {
  ///             'quantiy': 1,
  ///             'productName': 'Snake',
  ///             'minutes': 20,
  ///         })
  static String translateTemplate(
    String stringName,
    Map<String, String> params,
  ) {
    var translated = stringName.tr;
    for (var param in params.entries) {
      translated = translated.replaceAll('{${param.key}}', param.value);
    }
    return translated;
  }

  static bool isVn() {
    return currentLanguageCode == LANG_CODE_VI;
  }

  /// Return [viString] if [currentLanguageCode] is [LANG_CODE_VI].
  /// Otherwise return [enString]
  static String switchViEnString(String viString, String enString) {
    return isVn() ? viString : enString;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };
}
