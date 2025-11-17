import 'package:shared/src/extensions/string_extension.dart';

class InputValidator {
  static bool isEmail(String email) => email.validateEmail();

  static bool isPhoneNumber(String phoneNumber) => phoneNumber.validatePhone();

  static bool isDate(String date) => date.validateDate();

  static bool isDateTime(String dateTime) => dateTime.validateDateTime();

  static bool isURL(String url) => url.validateURL();

  static bool isPasswordValid(String password) =>
      password.length >= 8 && password.length <= 32;

  bool isSpecialSymbol(String input) => input.validateSymbol();
}
