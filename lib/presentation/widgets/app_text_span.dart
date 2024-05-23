import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:highlight_text/highlight_text.dart';

import '../../core/cores.dart';

class AppTextSpan extends StatelessWidget {
  const AppTextSpan(
    this.text, {
    super.key,
    required this.words,
    this.textStyle,
    this.highlightStyle,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final Map<String, VoidCallback?> words;
  final TextStyle? textStyle, highlightStyle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextHighlight(
      text: text,
      textAlign: textAlign,
      textStyle: textStyle ??
          context.textTheme.small?.copyWith(
            color: Palette.textGrey,
            fontSize: 14.sp,
          ),
      spanAlignment: PlaceholderAlignment.middle,
      words: words.map(
        (key, value) => MapEntry(
          key,
          HighlightedWord(
            padding: const EdgeInsets.all(0),
            onTap: value,
            textStyle: highlightStyle ??
                context.textTheme.big?.copyWith(
                  color: Palette.solidBlack,
                  fontSize: 14.sp,
                ),
          ),
        ),
      ),
    );
  }
}
