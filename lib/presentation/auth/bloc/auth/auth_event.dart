part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;

  const factory AuthEvent.loginRequested({
    required String credential,
    required String password,
  }) = _LoginRequested;

  const factory AuthEvent.logoutRequested() = _LogoutRequested;
}
