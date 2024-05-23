import 'package:flutter/services.dart';

class NoInitialZeroInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith('0')) {
      return oldValue;
    }
    return newValue;
  }
}
