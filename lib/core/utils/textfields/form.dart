import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormFieldWidget extends ConsumerWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final int? minLines;
  final int? maxLines;
  final Color? color;
  final bool? enabled;
  final TextAlign? textAlign;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final int? maxLength;

  const FormFieldWidget({
    super.key,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.textStyle,
    this.hintStyle,
    this.border,
    this.minLines,
    this.maxLines,
    this.color,
    this.enabled,
    this.textAlign,
    this.contentPadding,
    this.suffixIcon,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        border: border ?? InputBorder.none,
        hintText: hintText,
        hintStyle: hintStyle?.copyWith(color: color),
        suffixIcon: suffixIcon,
      ),
      style: textStyle?.copyWith(color: color),
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: enabled,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
