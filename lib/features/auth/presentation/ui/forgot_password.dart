import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/routes/route.gr.dart';
import 'package:flutter_application/features/auth/data/model/login_req.dart';
import 'package:flutter_application/features/auth/presentation/logic/others/logic.dart';
import 'package:flutter_application/features/auth/presentation/logic/provider.dart';
import 'package:flutter_application/services/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final logic = ref.watch(authLogic);
    final state = ref.watch(authNotifier);

    ref.listen(authNotifier, (previous, next) {
      next.whenOrNull(
        success: (data) => ref
            .read(routeService)
            .push(SignupRoute(email: data?.email ?? ''), context),
      );
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(logic.name),
          state.maybeWhen(
            orElse: () => const Text('No Data'),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) => Text(data?.email ?? ''),
          ),
          Center(
            child: InkWell(
              onTap: () {
                final params = LoginRequest(
                  username: 'emilys',
                  password: 'emilyspass',
                  expiresInMins: 30,
                );
                ref.read(authNotifier.notifier).login(params);
              },
              child: Text('LOGIN'),
            ),
          ),
        ],
      ),
    );
  }
}
