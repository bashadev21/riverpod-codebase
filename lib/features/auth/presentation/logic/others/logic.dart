import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authLogic = ChangeNotifierProvider((ref) => AuthLogic());

class AuthLogic extends ChangeNotifier {
  String name = '';

  void onName(String value) {
    name = value;
    notifyListeners();
  }
}
