import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/cores.dart';
import 'widgets.dart';

class AppButton extends StatelessWidget {
  final EdgeInsets? padding, margin;
  final String? title, titleFontFamily;
  final Function()? onPressed;
  final Widget? child, suffix;
  final bool loading, active;
  final MainAxisAlignment? mainAxisAlignment;
  final double? titleFontSize, spacing;
  final FontWeight? titleFontWeight;
  final Color? color,
      iconColor,
      textColor,
      hoverColor,
      disableTextColor,
      disableColor,
      borderColor;
  final double? elevation, disableElevation, radius, borderWidth, height, width;
  final BorderStyle? borderStyle;

  const AppButton({
    super.key,
    this.onPressed,
    this.child,
    this.color,
    this.elevation,
    this.hoverColor,
    this.disableTextColor,
    this.disableColor,
    this.disableElevation,
    this.radius,
    this.padding,
    this.margin,
    this.loading = false,
    this.mainAxisAlignment,
    this.borderColor,
    this.borderWidth,
    this.borderStyle,
    this.height,
    this.width,
    this.title,
    this.textColor,
    this.suffix,
    this.active = true,
    this.titleFontSize,
    this.titleFontFamily,
    this.iconColor,
    this.titleFontWeight,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      margin: margin,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          side: borderColor == null
              ? BorderSide.none
              : BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Colors.blue,
                  style: borderStyle ?? BorderStyle.solid,
                ),
          borderRadius: BorderRadius.circular(
            radius ?? 12,
          ),
        ),
        color: (active)
            ? (color ?? context.colorTheme.buttonColor)
            : (disableColor ?? Palette.textPlaceholder),
        elevation: elevation ?? 0,
        minWidth: 0,
        height: height ?? 48.h,
        hoverColor: hoverColor ?? Colors.transparent,
        focusColor: Colors.transparent,
        disabledColor: disableColor ?? Palette.textPlaceholder,
        disabledTextColor: disableTextColor,
        disabledElevation: disableElevation,
        padding: padding ?? const EdgeInsets.all(0),
        onPressed: (active) ? onPressed : null,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (loading) ...[
                  AppCircularProgressIndicator(size: 20.h),
                  // Spacing.width(spacing ?? 16),
                ],
                if (!loading)
                  AppText(
                    title ?? '',
                    style: context.textTheme.small?.copyWith(
                      color:
                          textColor ?? context.colorTheme.darkForegroundColor,
                      fontSize: titleFontSize,
                      fontWeight: titleFontWeight,
                      fontFamily: FontFamily.dmSansSemiBold,
                    ),
                  ),
              ],
            ),
      ),
    );
  }
}
