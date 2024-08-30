import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/core/styles/border_radius.style.dart';

class SecondaryButton extends ConsumerWidget {
  final Widget? child;
  final Function onTap;
  final double width;
  final double height;
  final Color? color;
  final double? elevation;
  final ShapeBorder? shape;
  final bool showLoader;
  final EdgeInsetsGeometry? padding;

  const SecondaryButton({
    super.key,
    required this.child,
    required this.onTap,
    this.height = 45,
    this.width = 45,
    this.color,
    this.elevation,
    this.shape,
    this.showLoader = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      elevation: elevation,
      onPressed: () => onTap(),
      minWidth: width,
      height: height,
      color: color,
      padding: padding,
      shape: shape ?? RoundedRectangleBorder(borderRadius: radius16),
      child: child,
    );
  }
}
