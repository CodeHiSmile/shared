import 'package:characters/characters.dart';
import 'package:flutter/services.dart';

class CharacterLengthLimitingTextInputFormatter extends TextInputFormatter {
  final int maxLength;

  CharacterLengthLimitingTextInputFormatter(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final current = newValue.text.characters;

    if (current.length > maxLength) {
      final truncated = current.take(maxLength).toString();
      return TextEditingValue(
        text: truncated,
        selection: TextSelection.collapsed(offset: truncated.length),
      );
    }
    return newValue;
  }
}
