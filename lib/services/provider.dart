import 'package:flutter_application/services/api.service.dart';
import 'package:flutter_application/services/dio.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application/services/cache.service.dart';
import 'package:flutter_application/services/file.service.dart';
// import 'package:flutter_application/services/permission.services.dart';
import 'package:flutter_application/services/route.services.dart';

final routeService = Provider<RouteService>(
  (ref) => RouteServiceImpl(),
);
final fileService = Provider<FileService>(
  (ref) => FileServiceImpl(),
);
final cacheService = Provider<CacheService>(
  (ref) => CacheServiceImpl(sharedPref: ref.read(sharedPreferencesProvider)),
);

final apiService = Provider<ApiService>(
  (ref) => ApiServiceImpl(
    cacheService: ref.read(cacheService),
    dio: ref.read(dioProvider),
  ),
);

// final permissionService = Provider<PermissionService>(
//   (ref) => PermissionServiceImpl(),
// );
