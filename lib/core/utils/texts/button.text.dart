import 'package:flutter/material.dart';
import 'package:flutter_application/core/styles/colors.style.dart';

class AppButtonText extends StatelessWidget {
  final String? data;
  final Color? color;

  const AppButtonText({
    super.key,
    required this.data,
    this.color = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelLarge;

    return Text(
      data ?? '',
      style: style?.copyWith(color: color),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
