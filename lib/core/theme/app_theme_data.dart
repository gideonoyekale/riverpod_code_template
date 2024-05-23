import 'package:flutter/material.dart';

import '../cores.dart';
import 'app_theme_extension.dart';

class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Palette.white,
    colorScheme: const ColorScheme.light(
      primary: Palette.solidBlack,
      surfaceTint: Palette.white,
      surface: Palette.white,
    ),
    datePickerTheme: DatePickerThemeData(
      dayStyle: const TextStyle(fontFamily: FontFamily.dmSansRegular),
      weekdayStyle: const TextStyle(fontFamily: FontFamily.dmSansRegular),
      headerHelpStyle: const TextStyle(fontFamily: FontFamily.dmSansRegular),
      yearStyle: const TextStyle(fontFamily: FontFamily.dmSansMedium),
      rangePickerHeaderHelpStyle:
          const TextStyle(fontFamily: FontFamily.dmSansRegular),
      rangePickerHeaderHeadlineStyle:
          const TextStyle(fontFamily: FontFamily.dmSansRegular),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Palette.solidBlack),
        textStyle: MaterialStateProperty.all(
            const TextStyle(fontFamily: FontFamily.dmSansBold)),
      ),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Palette.textGrey),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontFamily: FontFamily.dmSansRegular),
        ),
      ),
    ),
    splashColor: Palette.transparent,
    highlightColor: Palette.transparent,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Palette.solidBlack,
        textStyle: const TextStyle(
          fontFamily: FontFamily.dmSansMedium,
        ), // button text color
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[
      AppThemeExtension.light(),
    ],
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Palette.solidBlack,
    extensions: <ThemeExtension<dynamic>>[
      AppThemeExtension.dark(),
    ],
  );
}
