import 'package:shared/src/constants/base_constants.dart';
import 'package:shared/src/extensions/string_extension.dart';

class FormValidator {
  static String? onValidateEmail(String value) {
    if (value.isEmpty) return "Email không được để trống";
    if (!value.validateEmail()) return "Email không hợp lệ";
    return null;
  }

  static String? onValidatePhone(String value) {
    if (value.isEmpty) return "Vui lòng nhập Số điện thoại.";
    if (value.length != BaseConstants.phoneNumberLengthMin) {
      return 'Vui lòng nhập đầy đủ 10 số di động.';
    }
    if (!value.validatePhone()) {
      return 'Số điện thoại không hợp lệ.';
    }
    return null;
  }

  static String? onValidatePassword(String value) {
    if (value.isEmpty) return 'Mật khẩu không được để trống';
    if (!value.validatePassword()) return 'Mật khẩu không đúng định dạng';
    return null;
  }

  static String? onValidateNotNull(String? value, String title) {
    if (value == null || value.trim().isEmpty) {
      return "$title không được để trống.";
    }
    return null;
  }

  static String? validateFullName(String? value, String title) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập $title.';
    }
    if (value.validateName()) {
      return 'Không được nhập kí tự đặc biệt hoặc số.';
    }
    if (!value.trim().contains(' ')) {
      return 'Vui lòng nhập đầy đủ $title.';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Mật khẩu không được để trống.';
    }
    if (!value.validatePassword()) {
      return 'Mật khẩu có ít nhất 8 ký tự bao gồm chữ hoa, chữ thường, chữ số và ký tự đặc biệt.';
    }
    return null;
  }
}
