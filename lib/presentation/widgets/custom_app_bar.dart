import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/cores.dart';
import 'app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions,
    this.title,
    this.onBackPressed,
    this.backgroundColor,
    this.leading,
  });

  final List<Widget>? actions;
  final String? title;
  final Function()? onBackPressed;
  final Color? backgroundColor;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? context.colorTheme.appBg,
      titleSpacing: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 52.w,
      actions: actions,
      centerTitle: true,
      surfaceTintColor: backgroundColor ?? Palette.white,
      title: title == null
          ? null
          : AppText(
              title!,
              style: context.textTheme.big?.copyWith(
                color: Palette.solidBlack,
                fontSize: 20,
              ),
            ),
      leading: leading ??
          IconButton(
            onPressed: onBackPressed ?? () => Navigator.pop(context),
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 28.w,
              color: Palette.solidBlack,
            ),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
