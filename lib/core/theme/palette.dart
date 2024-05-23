import 'package:flutter/material.dart';

class Palette {
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color appBg = Color(0xfff7f7f7);
  static const Color transparent = Colors.transparent;

  static const Color stroke = Color(0xffd8d8d8);
  static const Color grey2 = Color(0xffF0F0F0);
  static const Color inputFieldStroke = Color(0x7fd8d8d8);
  static const Color solidRed = Color(0xffff3e41);
  static const Color solidWhite = Color(0xffffffff);
  static const Color solidBlack = Color(0xff090909);
  static const Color successGreen = Colors.green;
  static const Color textPlaceholder = Color(0xff828789);
  static const Color textGrey = Color(0xff7D7D7D);
  static const Color inputFieldBg = Color(0xffFAFAFA);
  static const Color iosDialogBg = Color(0x252525D1);
  static const Color iosDialogGrey = Color(0xff8C8C8C);
  static const Color homeBtnIconBg = Color(0xffF1388E);
  static const Color subscriptionCard = Color(0xffF5F5F5);
  static const Color homeBtn1 = Color(0xffFDF3F8);
  static const Color homeBtn2 = Color(0xffF3FCF2);
  static const Color locationRed = Color(0xffF64B3C);
  static const Color redText = Color(0xff2EB200);
  static const Color completed = Color(0xff16A34A);
  static const Color completedBg = Color(0xffDCFCE7);
  static const Color cancelled = Color(0xffDC2626);
  static const Color cancelledBg = Color(0xffFEE2E2);
  static const Color active = Color(0xffF59E0B);
  static const Color activeBg = Color(0xffFFFBEB);
  static const Color requestExhaustedCard = Color(0xFF3E410D);
  static const Color ratingStar = Color(0xFFFFCB45);
  static const Color ratingStar2 = Color(0xFFF2F2F2);

  static const LinearGradient shimmerGradient = LinearGradient(
    colors: [
      white,
      stroke,
    ],
    transform: GradientRotation(45),
  );
}
