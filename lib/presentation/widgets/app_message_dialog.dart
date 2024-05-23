import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/cores.dart';
import 'widgets.dart';

class AppMessageDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final String? actionTitle;
  const AppMessageDialog({
    super.key,
    this.title,
    this.message,
    this.actionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppRectangle(
      // color: context.colorTheme.appBg,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            title ?? 'Successful',
            style: context.textTheme.big?.copyWith(
              fontSize: 16.sp,
              color: Palette.solidRed,
            ),
            alignment: TextAlign.center,
          ),
          const Spacing.mediumHeight(),
          const AppRectangle(
            height: 1,
            color: Palette.inputFieldStroke,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 2),
          ),
          const Spacing.mediumHeight(),
          AppText(
            message ?? 'Kindly click the continue button to proceed',
            alignment: TextAlign.center,
            color: Palette.solidBlack,
          ),
          const Spacing.largeHeight(),
          AppButton(
            title: actionTitle ?? 'Done',
            onPressed: () {
              Navigator.pop(context, true);
            },
            height: 40.h,
            width: 120.w,
            color: Palette.solidRed,
          )
        ],
      ),
    );
  }
}
