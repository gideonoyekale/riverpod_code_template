import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppInputFormatters {
  static var dateFormatter = MaskTextInputFormatter(
    mask: '####-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  static var currencyFormatter = MaskTextInputFormatter(
    mask: '###,###.##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}
