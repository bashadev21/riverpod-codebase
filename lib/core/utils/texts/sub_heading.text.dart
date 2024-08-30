import 'package:flutter/material.dart';

class AppSubHeadingText extends StatelessWidget {
  final String? data;
  final Color? color;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const AppSubHeadingText({
    super.key,
    required this.data,
    this.textAlign,
    this.fontWeight,
    this.maxLines,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.displaySmall;

    return Text(
      data ?? '',
      style: style?.copyWith(color: color, fontWeight: fontWeight),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
