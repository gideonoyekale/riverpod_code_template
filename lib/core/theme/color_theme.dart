import 'package:flutter/material.dart';

import 'palette.dart';

class AppColorTheme extends ThemeExtension<AppColorTheme> {
  final Color? appBg;
  final Color? foregroundColor;
  final Color? darkForegroundColor;
  final Color? buttonColor;
  final Color? borderColor;
  AppColorTheme({
    this.appBg,
    this.foregroundColor,
    this.buttonColor,
    this.borderColor,
    this.darkForegroundColor,
  });

  AppColorTheme.light()
      : this(
          appBg: Palette.white,
          buttonColor: Palette.solidBlack,
          foregroundColor: Palette.solidBlack,
          borderColor: Palette.stroke,
          darkForegroundColor: Palette.solidWhite,
        );

  AppColorTheme.dark() : this();

  @override
  ThemeExtension<AppColorTheme> copyWith() {
    return AppColorTheme();
  }

  @override
  AppColorTheme lerp(covariant ThemeExtension<AppColorTheme>? other, double t) {
    if (other is! AppColorTheme) return this;
    return AppColorTheme(
      appBg: Color.lerp(appBg, other.appBg, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
    );
  }
}
