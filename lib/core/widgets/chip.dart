import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/core/styles/border_radius.style.dart';
import 'package:flutter_application/core/styles/colors.style.dart';

class ManualChip extends ConsumerWidget {
  final String label;
  final IconData? icon;
  final Color? color;
  final bool isSelected;
  final Function? onPressed;
  final TextStyle? labelStyle;

  const ManualChip({
    required this.label,
    this.icon,
    this.color,
    this.isSelected = false,
    this.onPressed,
    this.labelStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var leadIcon = icon != null ? Icon(icon, color: color) : null;

    return ActionChip(
      avatar: isSelected ? const Icon(Icons.check) : leadIcon,
      onPressed: onPressed == null ? null : () => onPressed!(),
      side: isSelected ? const BorderSide(color: AppColors.primary) : null,
      label: Text(label),
      labelStyle: labelStyle,
      shape: RoundedRectangleBorder(borderRadius: radius32),
    );
  }
}
