import 'package:flutter_application/features/auth/data/model/login_res.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.success({LoginResponse? data}) = AuthStateSuccess;
  const factory AuthState.error({String? msg}) = AuthStateError;
}
