part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;

  // Jika berhasil login atau token valid
  const factory AuthState.authenticated(UserModel user) = _Authenticated;

  // Jika gagal login, token expired, atau berhasil logout
  const factory AuthState.unauthenticated(String error) = _Unauthenticated;
}
