import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/routes/route.gr.dart';
import 'package:flutter_application/features/auth/data/model/login_req.dart';
import 'package:flutter_application/features/auth/data/model/login_res.dart';
import 'package:flutter_application/features/auth/presentation/logic/others/logic.dart';
import 'package:flutter_application/features/auth/presentation/logic/provider.dart';
import 'package:flutter_application/services/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logic = ref.watch(authLogic);
    final state = ref.watch(authNotifier);

    ref.listen(authNotifier, (previous, next) {
      next.whenOrNull(
          error: (msg) {},
          success: (data) {
            final cache = ref.read(cacheService);
            ref
                .read(routeService)
                .push(SignupRoute(email: data?.email ?? ''), context,);

            cache.setCache('loginDetails', jsonEncode(data?.toJson()));
            final response = cache.getCache('loginDetails');
            LoginResponse datavalues = loginResponseFromJson(response);

            print(datavalues.email);
          });
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(logic.name),
          Consumer(builder: (context, ref, child) {
            return state.maybeWhen(


              orElse: () => const Text('No Data'),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (data) => Text(data?.email ?? ''),
            );
          }),
          Center(
            child: InkWell(
              onTap: () async {
                ref.invalidate(authLogic);

                final params = LoginRequest(
                  username: 'emilys',
                  password: 'emilyspass',
                  expiresInMins: 30,
                );

                await ref.read(authNotifier.notifier).login(params);
              },
              child: const Text('LOGIN'),
            ),
          ),
        ],
      ),
    );
  }
}
