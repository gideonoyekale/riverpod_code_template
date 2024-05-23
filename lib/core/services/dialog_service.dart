import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../presentation/widgets/widgets.dart';
import '../cores.dart';

class DialogService {
  DialogService(this._context);

  final BuildContext _context;

  // final NavigationService _navigationService;
  bool loading = false;

  void showLoading({String? message}) async {
    loading = true;
    return await showDialog(
      useSafeArea: true,
      // context: context,
      context: _context,
      barrierDismissible: true,
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        scrollable: false,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        // title: AppText.text('Set Date and Time',
        //     fontSize: 20, fontWeight: FontWeight.bold),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Palette.solidBlack,
                strokeWidth: 2,
              ),
            ),
            DeviceUtils.widthSpacer(
              _context,
              0.04,
            ),
            AppText(
              message ?? 'Loading...',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
        // insetPadding: EdgeInsets.zero,
      ),
    );
  }

  // Future<bool?> showYesOrNo({
  //   String? title,
  //   String? message,
  //   String? yesTitle,
  //   String? noTitle,
  // }) async {
  //   return await showAppDialog(
  //     AppYesOrNoDialog(
  //       title: title,
  //       message: message,
  //       yesTitle: yesTitle,
  //       noTitle: noTitle,
  //     ),
  //   );
  // }

  Future<T?> showAppBottomSheet<T>(Widget child) async {
    return await showModalBottomSheet(
      context: _context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (context) => child,
    );
  }

  Future<dynamic> showMessage({
    String? title,
    String? message,
    String? actionTitle,
  }) async {
    return await showAppDialog(
      AppMessageDialog(
        title: title,
        message: message,
        actionTitle: actionTitle,
      ),
    );
  }

  Future<bool?> showAppYesOrNo({
    String? title,
    String? message,
    String? actionTitle,
    String? yesTitle,
    String? noTitle,
  }) async {
    return await showAppDialog(
      AppYesOrNoDialog(
        title: title,
        message: message,
        yesTitle: yesTitle,
        noTitle: noTitle,
        noPressed: () {
          Navigator.pop(_context, false);
        },
        yesPressed: () async {
          Navigator.pop(_context, true);
        },
      ),
    );
  }

  Future<T?> showAppDialog<T>(
    Widget child, {
    EdgeInsets? padding,
    double? elevation,
    Color? barrierColor,
    bool? dismissible,
  }) async {
    return await showDialog(
      useSafeArea: true,
      context: _context,
      barrierDismissible: dismissible ?? true,
      barrierColor: barrierColor ?? Colors.black87.withOpacity(0.7),

      ///
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: _context.colorTheme.appBg,
        elevation: elevation ?? 0,
        scrollable: true,
        contentPadding: const EdgeInsets.all(0),
        insetPadding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 32,
            ),
        content: child,
        // insetPadding: EdgeInsets.zero,
      ),
    );
  }

  Future<bool?> showYesOrNoiOSDialog<T>({
    String? title,
    String? message,
    EdgeInsets? padding,
    double? elevation,
    Color? barrierColor,
    bool? dismissible,
  }) async {
    return await showCupertinoDialog(
      context: _context,
      barrierDismissible: dismissible ?? true,
      builder: (c) => CupertinoAlertDialog(
        // title: new Text("Dialog Title"),

        content: AppText(message ?? ''),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const AppText("No"),
            onPressed: () {
              Navigator.pop(_context, false);
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const AppText("Yes"),
            onPressed: () {
              Navigator.pop(_context, true);
            },
          ),
        ],
      ),
    );
  }

  void dismiss() {
    if (!Navigator.canPop(_context)) return;
    Navigator.of(_context).pop();
  }
}

final dialogService = Provider.family(
  (ref, BuildContext context) => DialogService(context),
);
