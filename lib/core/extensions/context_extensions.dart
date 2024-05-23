import 'package:flutter/cupertino.dart';

import '../cores.dart';
import '../theme/app_theme_extension.dart';

extension ContextExtension on BuildContext {
  AppTextTheme get textTheme => AppThemeExtension.of(this).textTheme!;
  AppColorTheme get colorTheme => AppThemeExtension.of(this).colorTheme!;
  double width(double scale) => MediaQuery.of(this).size.width * scale;
  double height(double scale) => MediaQuery.of(this).size.height * scale;

  void showError(String message) {
    SnackbarService().error(message: message);
  }

  void showSuccess(String message) {
    SnackbarService().success(message: message);
  }
}
