import 'package:flutter/material.dart';
import 'package:flutter_application/app.dart';
import 'package:flutter_application/core/config/app.config.dart';
import 'package:flutter_application/core/constants/enum.constants.dart';
import 'package:flutter_application/services/dio.service.dart';
import 'package:flutter_application/services/cache.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Set App Flavour
  setMode = Flavour.release;
  // var appCheck = FirebaseAppCheck.instance;
  // await appCheck.activate();
  // await appCheck.setTokenAutoRefreshEnabled(true);
  final sharedPreferences = await SharedPreferences.getInstance();
  // Enable dio services
  final dio = DioApi.createDio();
  // Enable Firebase crashlytics
  // if (mode == Flavour.release) {
  //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //   FlutterError.onError = (errorDetails) async {
  //     await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  //   };
  // }
  runApp(ProviderScope(overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    dioProvider.overrideWithValue(dio),
  ], child: const App()));
}
