import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider() : super(false);

  set setTheme(bool theme) => state = theme;
}
