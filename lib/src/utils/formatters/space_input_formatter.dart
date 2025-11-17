import 'package:flutter/services.dart';

class SpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isNotEmpty) {
      int currentOffset = newValue.selection.baseOffset;
      String updatedText = newValue.text.replaceAll(RegExp(r"\s+"), ' ');
      int updatedOffset =
          currentOffset - (newValue.text.length - updatedText.length);
      updatedOffset = updatedOffset.clamp(0, updatedText.length);

      return TextEditingValue(
        text: updatedText,
        selection: TextSelection.collapsed(offset: updatedOffset),
      );
    }

    return newValue;
  }
}
