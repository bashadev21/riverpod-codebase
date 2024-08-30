import 'package:flutter/material.dart';
import 'package:flutter_application/core/providers/data/user.provider.dart';
import 'package:flutter_application/core/providers/locale/locale.provider.dart';
import 'package:flutter_application/core/providers/theme/theme.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<UserProvider, dynamic>(
  (ref) => UserProvider(),
);

final localeProvider = StateNotifierProvider<LocaleProvider, Locale>(
  (ref) => LocaleProvider(),
);

final themeProvider = StateNotifierProvider<ThemeProvider, bool>(
  (ref) => ThemeProvider(),
);
