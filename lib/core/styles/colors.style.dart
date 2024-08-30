import 'package:flutter/material.dart';

class AppColors {
  static const List<Color> colors1 = [
    Color(0xff6969df),
    Color(0xff32a7e2),
    Color(0xff22b07d),
    Color(0xffb548c6),
    Color(0xffff8700),
    Color(0xff12cdd9),
    Color(0xfff67171),
    Color(0xffffb648),
  ];

  static const List<Color> colors2 = [
    Color(0xffffffff),
    Color(0xfffdd6ce),
    Color(0xffc8e6c8),
    Color(0xffabcef5),
    Color(0xffe5a9b9),
    Color(0xffc4b6eb),
  ];

  static const List<Color> colors3 = [
    Color(0xff6969df),
    Color(0xff32a7e2),
    Color(0xff22b07d),
    Color(0xffb548c6),
    Color(0xffff8700),
    Color(0xfff67171),
  ];

  static const Color backgroundLIGHT = Color(0xffFFFFFF);
  static const Color backgroundDARK = Color(0xff121212);
  static const Color backgroundGREY = Color(0xffF1F1F1);

  static const Color primary = primarySwatch;

  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static const Color indigo = Colors.indigo;
  static const Color orange = Colors.orange;
  static const Color pink = Colors.pink;
  static const Color purple = Colors.purple;
  static const Color deepOrange = Colors.deepOrange;
  static const Color green = Colors.green;
  static const Color red = Colors.red;
  static const Color yellow = Colors.yellow;
  static const Color amber = Colors.amber;
  static const Color blue = Colors.blue;
  static Color lightGrey = Colors.grey.shade300;
  static Color darkGrey = Colors.grey.shade700;

  static const MaterialColor primarySwatch = MaterialColor(0xff757ff4, _swatch);

  static const Map<int, Color> _swatch = {
    50: Color.fromRGBO(117, 127, 244, .1),
    100: Color.fromRGBO(117, 127, 244, .2),
    200: Color.fromRGBO(117, 127, 244, .3),
    300: Color.fromRGBO(117, 127, 244, .4),
    400: Color.fromRGBO(117, 127, 244, .5),
    500: Color.fromRGBO(117, 127, 244, .6),
    600: Color.fromRGBO(117, 127, 244, .7),
    700: Color.fromRGBO(117, 127, 244, .8),
    800: Color.fromRGBO(117, 127, 244, .9),
    900: Color.fromRGBO(117, 127, 244, 1),
  };
}
