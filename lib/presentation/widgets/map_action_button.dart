import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/cores.dart';
import 'app_rectangle.dart';

class MapActionButton extends StatelessWidget {
  final Function()? onTap;
  final String icon;
  final bool showIndicator;

  const MapActionButton({
    super.key,
    this.onTap,
    required this.icon,
    this.showIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          AppRectangle(
            color: Palette.solidBlack.withOpacity(0.6),
            shape: BoxShape.circle,
            height: 44.h,
            width: 44.h,
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              icon,
              color: Palette.white,
            ),
          ),
          if (showIndicator)
            Positioned(
              right: 2,
              top: 2,
              child: AppRectangle(
                shape: BoxShape.circle,
                color: Palette.solidRed,
                height: 10.h,
                width: 10.h,
              ),
            )
        ],
      ),
    );
  }
}
