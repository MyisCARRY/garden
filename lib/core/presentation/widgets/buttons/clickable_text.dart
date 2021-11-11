import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({
    required this.customSpans,
    this.textAlign = TextAlign.start,
    Key? key,
  }) : super(key: key);

  final TextAlign textAlign;
  final List<InlineSpan> customSpans;

  @override
  Widget build(BuildContext context) => RichText(
        textAlign: textAlign,
        text: TextSpan(children: customSpans),
      );

  static TextSpan nonClickableSpan({
    required String text,
    required TextStyle style,
  }) =>
      TextSpan(
        text: text,
        style: style,
      );

  static TextSpan clickableSpan({
    required String text,
    required TextStyle style,
    void Function()? onTap,
  }) =>
      TextSpan(
        text: text,
        style: style,
        recognizer: TapGestureRecognizer()..onTap = onTap,
      );
}
