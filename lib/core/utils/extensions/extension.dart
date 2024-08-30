import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Padding paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);
  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) =>
      Padding(
          padding:
              EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
          child: this);
  Padding paddingOnly(
          {double left = 0.0,
          double top = 0.0,
          double right = 0.0,
          double bottom = 0.0}) =>
      Padding(
          padding: EdgeInsets.only(
              left: left, top: top, right: right, bottom: bottom),
          child: this);
}

extension SizeExtension on int {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}

extension SizeExtensionDouble on double {
  SizedBox get h => SizedBox(height: this);
  SizedBox get w => SizedBox(width: this);
}

extension TextStyleExtension on Text {
  Text withStyle(TextStyle style) => Text(data!, style: style);
}

extension TextStyleModifiers on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle withFont(String fontFamily) => copyWith(fontFamily: fontFamily);
  TextStyle withDecoration(TextDecoration decoration) =>
      copyWith(decoration: decoration);
  TextStyle withLetterSpacing(double spacing) =>
      copyWith(letterSpacing: spacing);
  TextStyle withWordSpacing(double spacing) => copyWith(wordSpacing: spacing);
  TextStyle withHeight(double height) => copyWith(height: height);
}

extension HexColor on String {
  Color toColor() {
    String hex = replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // add opacity if missing
    }
    return Color(int.parse(hex, radix: 16));
  }
}
