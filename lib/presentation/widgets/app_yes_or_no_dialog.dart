// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../cores.dart';
//
// class AppYesOrNoDialog extends StatelessWidget {
//   final String? title, message, yesTitle, noTitle;
//
//   const AppYesOrNoDialog(
//       {super.key, this.title, this.message, this.yesTitle, this.noTitle});
//
//   @override
//   Widget build(BuildContext context) {
//     return AppRectangle(
//       // color: context.colorTheme.appBg,
//       padding: const EdgeInsets.all(32),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Image.asset(
//           //   AppAssets.successIllustration,
//           //   height: context.height(0.2),
//           // ), //
//           Icon(
//             Iconsax.info_circle4,
//             size: context.height(0.1),
//             color: Palette.pending,
//           ),
//           const Spacing.bigHeight(),
//           AppText(
//             title ?? 'Successful',
//             style: context.textTheme.big,
//             alignment: TextAlign.center,
//           ),
//           if (message != null) ...[
//             const Spacing.smallHeight(),
//             AppText(
//               message ?? 'Kindly click the continue button to proceed',
//               alignment: TextAlign.center,
//               color: Palette.greyText,
//             ),
//           ],
//           const Spacing.mediumHeight(),
//           Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: AppButton(
//                   title: yesTitle ?? 'Yes',
//                   onPressed: () {
//                     Navigator.pop(context, true);
//                   },
//                   color: context.colorTheme.foregroundColor,
//                   textColor: context.colorTheme.foregroundColor2,
//                   suffix: Container(),
//                 ),
//               ),
//               Spacing.smallWidth(),
//               Expanded(
//                 child: AppButton(
//                   title: noTitle ?? 'No',
//                   onPressed: () {
//                     Navigator.pop(context, false);
//                   },
//                   color: Palette.greyText,
//                   suffix: Container(),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
