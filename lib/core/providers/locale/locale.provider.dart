import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/core/l10n/l10n.dart';

class LocaleProvider extends StateNotifier<Locale> {
  LocaleProvider() : super(const Locale('en'));

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    state = locale;
  }
}
