import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/cores.dart';
import '../../widgets/widgets.dart';

class AppDrawer extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppDrawer(this.scaffoldKey, {super.key});

  @override
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return AppRectangle(
      height: double.maxFinite,
      width: 250.w,
      color: Palette.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText('App Drawer')
        ],
      ),
    );
  }

}

class AppDrawerItem extends StatelessWidget {
  const AppDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    this.trailingText,
    this.onPressed,
  });

  final String title, icon;
  final String? trailingText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      highlightColor: Palette.transparent,
      splashColor: Palette.transparent,
      child: AppRectangle(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
            ),
            Spacing.width(12.w),
            Expanded(
              child: AppText(
                title,
                color: Palette.solidBlack,
                fontSize: 14.sp,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (trailingText != null) ...[
              const Spacing.smallWidth(),
              AppText(
                trailingText!,
                style: context.textTheme.medium?.copyWith(
                  color: Palette.solidRed,
                  fontSize: 14.sp,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
