import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/cores.dart';

import 'widgets.dart';

class AppYesOrNoSheet extends StatelessWidget {
  const AppYesOrNoSheet(
      {super.key,
      this.message,
      this.title,
      this.yesTitle,
      this.noTitle,
      this.noPressed,
      this.yesPressed});

  final String? message, title, yesTitle, noTitle;
  final Function()? noPressed, yesPressed;

  @override
  Widget build(BuildContext context) {
    return AppRectangle(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            title ?? 'Logout',
            style: context.textTheme.semiBold?.copyWith(fontSize: 18.sp),
          ),
          const AppRectangle(
            height: 1,
            color: Palette.inputFieldStroke,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 24),
          ),
          AppText(
            message ?? 'Are you sure you want to logout?',
            style: context.textTheme.semiBold?.copyWith(fontSize: 18.sp),
            alignment: TextAlign.center,
          ),
          const Spacing.bigHeight(),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  title: noTitle ?? 'Cancel',
                  onPressed: noPressed,
                  textColor: Palette.solidBlack,
                  color: Palette.solidBlack.withOpacity(0.1),
                ),
              ),
              const Spacing.mediumWidth(),
              Expanded(
                child: AppButton(
                  onPressed: yesPressed,
                  title: yesTitle ?? 'Yes, logout',
                  color: Palette.solidRed,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AppYesOrNoDialog extends StatelessWidget {
  const AppYesOrNoDialog(
      {super.key,
      this.message,
      this.title,
      this.yesTitle,
      this.noTitle,
      this.noPressed,
      this.yesPressed});

  final String? message, title, yesTitle, noTitle;
  final Function()? noPressed, yesPressed;

  @override
  Widget build(BuildContext context) {
    return AppRectangle(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            title ?? 'Logout',
            style: context.textTheme.big?.copyWith(
              fontSize: 16.sp,
              color: Palette.solidRed,
            ),
          ),
          const AppRectangle(
            height: 1,
            color: Palette.inputFieldStroke,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 12),
          ),
          AppText(
            message ?? 'Are you sure you want to logout?',
            fontSize: 14.sp,
            color: Palette.solidBlack,
            alignment: TextAlign.center,
          ),
          const Spacing.bigHeight(),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: AppButton(
                  title: noTitle ?? 'Cancel',
                  height: 40.h,
                  onPressed: noPressed,
                  textColor: Palette.solidBlack,
                  color: Palette.solidBlack.withOpacity(0.1),
                ),
              ),
              const Spacing.mediumWidth(),
              Flexible(
                flex: 1,
                child: AppButton(
                  height: 40.h,
                  onPressed: yesPressed,
                  title: yesTitle ?? 'Yes, logout',
                  color: Palette.solidRed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
