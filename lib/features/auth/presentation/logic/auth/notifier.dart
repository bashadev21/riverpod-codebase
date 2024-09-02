import 'package:flutter_application/features/auth/data/model/login_req.dart';
import 'package:flutter_application/features/auth/data/model/login_res.dart';
import 'package:flutter_application/features/auth/domain/usecase/auth_usecase.dart';
import 'package:flutter_application/features/auth/presentation/logic/auth/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthUsecase userAuth;

  AuthNotifier({required this.userAuth}) : super(const AuthState.initial());

  Future<LoginResponse?> login(LoginRequest params) async {
    state = const AuthState.loading();

    final data = await userAuth.login(params);

    data.fold(
      (l) => state = AuthState.error(msg: l.msg),
      (r) {
        state = AuthState.success(data: r);
      },
    );
    return null;
  }
}
