import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

class StringUtils {
  const StringUtils._();

  // 👉 Xử lý chuỗi cơ bản
  static String capitalizeEachWord(String text) {
    if (text.isEmpty) return text;
    text = text.replaceAll(RegExp(r'\s+'), ' ');
    return text
        .trim()
        .split(' ')
        .map((word) => toBeginningOfSentenceCase(word))
        .join(' ');
  }

  static String truncate(String text, int length) {
    if (text.length <= length) return text;
    return "${text.substring(0, length)}...";
  }

  static String paddingZero(String val, [int length = 2]) {
    return val.padLeft(length, '0');
  }

  static String formatRegister(String input) {
    String cleaned = input.replaceAll(RegExp(r'\s+'), ' ');
    List<String> parts = cleaned.split(' ');
    return parts
        .map((e) => e.isEmpty ? '' : e[0].toUpperCase() + e.substring(1))
        .join(' ');
  }

  static String removeSpecialCharacters(String input) {
    final regex = RegExp(r'[^\w\s]|_');
    return input.replaceAll(regex, '');
  }

  // static String formatCustomerName(String name) {
  //   //use lib: diacritic:
  //   Tác dụng: Bỏ dấu tiếng Việt
  //   return removeDiacritics(name).replaceAll(' ', '').toUpperCase();
  // }

  static String encodeCharacter(String text) {
    final bytes = utf8.encode(text);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static String formatInputNumber(String input) {
    return input.replaceAll(RegExp(r'[^0-9]'), '');
  }

  // 👉 Ẩn thông tin nhạy cảm
  static String maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 3) return phoneNumber;
    final lastThree = phoneNumber.substring(phoneNumber.length - 3);
    final masked = '*' * (phoneNumber.length - 3);
    return masked + lastThree;
  }

  static String maskAddress(String address) {
    List<String> parts = address.split(',');
    if (parts.length > 4) {
      return "***, ${parts.sublist(0, parts.length - 3).join(',')}";
    } else {
      int firstComma = address.indexOf(',');
      return firstComma != -1 ? "***${address.substring(firstComma)}" : "***";
    }
  }
}
