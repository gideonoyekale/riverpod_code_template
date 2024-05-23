import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../presentation/widgets/widgets.dart';
import '../cores.dart';

class BottomSheetService {
  BottomSheetService();

  Future<String?> show(BuildContext context, Widget child,
      {bool? scrolledControl}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: scrolledControl ?? true,
      isDismissible: true,
      // backgroundColor: Colors.black.withOpacity(0.01),
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        width: double.maxFinite,
        margin: const EdgeInsets.only(
            // top: MediaQuery.of(context).padding.top,
            ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppRectangle(
              height: 2.h,
              color: Palette.inputFieldStroke,
              width: 55.w,
              radius: 100,
              margin: const EdgeInsets.only(top: 16),
            ),
            child,
          ],
        ),
      ),
    );
  }

  Future<void> showExitAppSheet(BuildContext context) async {
    await show(
      context,
      AppYesOrNoSheet(
        title: 'Exit App',
        message: 'Are you sure you want to exit app?',
        yesTitle: 'Yes, exit',
        noPressed: () => Navigator.pop(context),
        yesPressed: () async {
          exit(0);
        },
      ),
    );
  }
}

final bottomSheetService = Provider(
  (ref) => BottomSheetService(),
);
