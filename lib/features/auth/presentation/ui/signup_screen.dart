import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/features/auth/presentation/logic/others/logic.dart';
import 'package:flutter_application/services/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SignupPage extends ConsumerStatefulWidget {
  final String email;
  const SignupPage({super.key, this.email = ''});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(widget.email),
          ),
          Center(
            child: InkWell(
                onTap: () {
                  ref.read(authLogic).onName('Basha');
                  ref.read(routeService).pop(context);
                },
                child: Text('SIGNUP')),
          ),
        ],
      ),
    );
  }
}
