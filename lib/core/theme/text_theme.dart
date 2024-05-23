import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cores.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle? large;
  final TextStyle? big;
  final TextStyle? regular;
  final TextStyle? extraSmall;
  final TextStyle? small;
  final TextStyle? medium;
  final TextStyle? semiBold;

  AppTextTheme({
    this.large,
    this.big,
    this.regular,
    this.extraSmall,
    this.small,
    this.medium,
    this.semiBold,
  });

  AppTextTheme.light()
      : this(
          large: TextStyle(
            fontSize: 32.sp,
            color: Palette.solidBlack,
            height: 1.3,
            letterSpacing: -0.3,
            fontFamily: FontFamily.dmSansBold,
          ),
          big: TextStyle(
            fontSize: 24.sp,
            color: Palette.solidBlack,
            height: 1.3,
            letterSpacing: -0.3,
            fontFamily: FontFamily.dmSansBold,
          ),
          regular: TextStyle(
            fontSize: 14.sp,
            color: Palette.textGrey,
            height: 1.3,
            letterSpacing: -0.3,
            fontFamily: FontFamily.dmSansRegular,
          ),
          medium: TextStyle(
            fontSize: 14.sp,
            color: Palette.solidBlack,
            height: 1.3,
            letterSpacing: -0.3,
            fontFamily: FontFamily.dmSansMedium,
          ),
          semiBold: TextStyle(
            fontSize: 20.sp,
            color: Palette.solidBlack,
            height: 1.3,
            letterSpacing: -0.3,
            fontFamily: FontFamily.dmSansSemiBold,
          ),
          small: TextStyle(
            fontSize: 14.sp,
            color: Palette.textGrey,
            height: 1.3,
            letterSpacing: -0.3,
            fontFamily: FontFamily.dmSansRegular,
          ),
          extraSmall: TextStyle(
            fontSize: 10.sp,
            color: Palette.textGrey,
            height: 1.3,
            letterSpacing: -0.3,
            fontFamily: FontFamily.dmSansRegular,
          ),
        );

  AppTextTheme.dark() : this();

  @override
  ThemeExtension<AppTextTheme> copyWith({
    final TextStyle? large,
    final TextStyle? big,
    final TextStyle? medium,
    final TextStyle? regular,
    final TextStyle? extraSmall,
    final TextStyle? small,
  }) {
    return AppTextTheme(
      large: large ?? this.large,
      big: big ?? this.big,
      regular: regular ?? this.regular,
      medium: medium ?? this.medium,
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
    );
  }

  @override
  AppTextTheme lerp(covariant ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) return this;
    return AppTextTheme(
      large: TextStyle.lerp(large, other.large, t),
      big: TextStyle.lerp(big, other.big, t),
      regular: TextStyle.lerp(regular, other.regular, t),
      small: TextStyle.lerp(small, other.small, t),
      extraSmall: TextStyle.lerp(extraSmall, other.extraSmall, t),
    );
  }
}
