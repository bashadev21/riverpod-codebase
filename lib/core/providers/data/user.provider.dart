import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProvider extends StateNotifier<dynamic> {
  UserProvider() : super(dynamic);

  set setUser(dynamic data) => state = data;
}
