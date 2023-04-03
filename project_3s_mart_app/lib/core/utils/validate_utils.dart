import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project_3s_mart_app/translation/strings.dart';

class ValidateUtils {
  static String? validateEmpty(String value) {
    if (value.trim().isEmpty) {
      return Strings.required.tr;
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.trim().isEmpty) {
      return Strings.required.tr;
    } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
      return Strings.invalidPhone.tr;
    }
    return null;
  }

  static String? validateFullName(String value) {
    if (value.trim().isEmpty) {
      return Strings.required.tr;
    } else if (!RegExp(
                "^[^<>{}\"/|;:.,~!?@#\$%^=&*\\]\\\\()\\[¿§«»ω⊙¤°℃℉€¥£¢¡®©0-9_+]*\$")
            .hasMatch(value) ||
        value.length > 30) {
      return Strings.invalidName.tr;
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.trim().isEmpty) {
      return Strings.required.tr;
    } else if (!RegExp(
            r"^[\w!#$%&'*+\-/=?\^_`{|}~]+(\.[\w!#$%&'*+\-/=?\^_`{|}~]+)*" +
                r"@" +
                r"((([\-\w]+\.)+[a-zA-Z]{2,4})|(([0-9]{1,3}\.){3}[0-9]{1,3}))$")
        .hasMatch(value)) {
      return Strings.invalidEmail.tr;
    }
    return null;
  }

  static String? validateCardNumWithLuhnAlgorithm(String input) {
    if (input.isEmpty) {
      return Strings.required.tr;
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      // No need to even proceed with the validation if it's less than 8 characters
      return Strings.cardIsInvalid.tr;
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return Strings.cardIsInvalid.tr;
  }

  static String? validateExpiryDate(String value) {
    if (value.isEmpty) {
      return Strings.required.tr;
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains(RegExp(r'(\/)'))) {
      var split = value.split(RegExp(r'(\/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return Strings.expiryMonthIsInvalid.tr;
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid year should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return Strings.expiryYearIsInvalid.tr;
    }

    if (!hasDateExpired(month, year)) {
      return Strings.cardHasExpired.tr;
    }
    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int? month, int? year) {
    return !(month == null || year == null) && isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is less than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently, is greater than card's
    // year
    return fourDigitsYear < now.year;
  }

  static String? validateCVV(String value) {
    if (value.isEmpty) {
      return Strings.required.tr;
    }

    if (value.length < 3 || value.length > 4) {
      return Strings.cVVIsInvalid.tr;
    }
    return null;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }
}
