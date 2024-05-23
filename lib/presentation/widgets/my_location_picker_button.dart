import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/cores.dart';
import 'widgets.dart';

class MyLocationPickerButton extends StatelessWidget {
  const MyLocationPickerButton({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppRectangle(
        color: Palette.solidRed,
        shape: BoxShape.circle,
        height: 44.h,
        width: 44.h,
        margin: const EdgeInsets.all(24),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          AppAssets.myLocation,
          color: Palette.white,
        ),
      ),
    );
  }
}
