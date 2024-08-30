import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app.constants.dart';
import 'package:flutter_application/core/keys/global.key.dart';
import 'package:flutter_application/core/l10n/l10n.dart';
import 'package:flutter_application/core/providers/providers.dart';
import 'package:flutter_application/core/routes/route.dart';
import 'package:flutter_application/core/routes/route.gr.dart';
import 'package:flutter_application/core/styles/theme.style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final darkTheme = ref.watch(themeProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: messengerKey,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(
        deepLinkBuilder: (deepLink) => const DeepLink([LoginRoute()]),
      ),
      title: AppConstants.app,
      themeMode: darkTheme ? ThemeMode.dark : ThemeMode.light,
      theme: AppThemeData.light,
      darkTheme: AppThemeData.dark,
      supportedLocales: L10n.all,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
