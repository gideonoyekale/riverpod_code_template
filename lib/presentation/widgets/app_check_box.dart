import 'package:flutter/material.dart';

import '../../core/cores.dart';
import 'widgets.dart';

class AppCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool value)? onChange;
  final Color? borderColor, tickColor, backgroundColor;
  final double? height, width, tickSize, radius, borderWidth;
  const AppCheckBox({
    super.key,
    required this.value,
    this.onChange,
    this.borderColor,
    this.backgroundColor,
    this.tickColor,
    this.height,
    this.tickSize,
    this.width,
    this.radius,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () {
        if (onChange != null) onChange!(!value);
      },
      active: false,
      disableColor: Palette.transparent,
      height: height ?? 20,
      width: width ?? 20,
      radius: radius ?? 2,
      borderColor: borderColor ?? Palette.black,
      borderWidth: borderWidth ?? 1,
      color: backgroundColor ?? Palette.transparent,
      child: value
          ? Icon(
              Icons.done,
              size: tickSize ?? 14,
              color: tickColor ?? Palette.black,
            )
          : Container(),
    );
  }
}
