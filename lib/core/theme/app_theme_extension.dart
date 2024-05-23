import 'package:flutter/material.dart';

import 'color_theme.dart';
import 'text_theme.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final AppTextTheme? textTheme;
  final AppColorTheme? colorTheme;

  static AppThemeExtension of(BuildContext context) =>
      Theme.of(context).extension<AppThemeExtension>()!;

  AppThemeExtension({this.textTheme, this.colorTheme});

  AppThemeExtension.light()
      : this(
          textTheme: AppTextTheme.light(),
          colorTheme: AppColorTheme.light(),
        );

  AppThemeExtension.dark() : this();

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    final AppTextTheme? textTheme,
    final AppColorTheme? colorTheme,
  }) {
    return AppThemeExtension(
      textTheme: textTheme ?? this.textTheme,
      colorTheme: colorTheme ?? this.colorTheme,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
      covariant ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      textTheme: textTheme?.lerp(other.textTheme, t),
      colorTheme: colorTheme?.lerp(other.colorTheme, t),
    );
  }
}
