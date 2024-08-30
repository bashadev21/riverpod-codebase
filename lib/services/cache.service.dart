import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

abstract class CacheService {
  Future<void> setCache(String key, dynamic val);
  dynamic getCache(String key);
  Future<void> clearCache(String key);
  Future<void> clearAll();
}

class CacheServiceImpl implements CacheService {
  final SharedPreferences _sharedPref;

  CacheServiceImpl({
    required SharedPreferences sharedPref,
  }) : _sharedPref = sharedPref;

  @override
  Future<void> setCache(String key, dynamic val) async {
    if (val is String) {
      await _sharedPref.setString(key, val);
    } else if (val is bool) {
      await _sharedPref.setBool(key, val);
    } else if (val is int) {
      await _sharedPref.setInt(key, val);
    } else if (val is double) {
      await _sharedPref.setDouble(key, val);
    } else {
      await _sharedPref.setString(key, '$val');
    }
  }

  @override
  dynamic getCache(String key) => _sharedPref.get(key);

  @override
  Future<void> clearCache(String key) async => await _sharedPref.remove(key);

  @override
  Future<void> clearAll() async => await _sharedPref.clear();
}
