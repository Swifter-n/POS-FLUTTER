import 'package:avis_pos/data/model/payloads/login_payload.dart';
import 'package:avis_pos/data/model/responses/user_model.dart';
import 'package:avis_pos/domain/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository;

  AuthBloc(this._repository) : super(const _Initial()) {
    on<_CheckAuthStatus>(_onCheckAuthStatus);
    on<_LoginRequested>(_onLoginRequested);
    on<_LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onCheckAuthStatus(
    _CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    // getProfile akan mengecek token di local storage lalu memvalidasinya ke server
    final result = await _repository.getProfile();

    result.fold(
      (failure) => emit(AuthState.unauthenticated(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onLoginRequested(
    _LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final payload = LoginPayload(
      credential: event.credential,
      password: event.password,
      device_name: 'POS_App', // Disesuaikan dengan kebutuhan backend
    );

    final result = await _repository.login(payload);

    result.fold(
      (failure) => emit(AuthState.unauthenticated(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onLogoutRequested(
    _LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _repository.logout();

    result.fold(
      // Terlepas dari apakah API berhasil atau gagal (misal tidak ada internet),
      // kita lempar ke unauthenticated agar user tetap bisa keluar dari aplikasi.
      (failure) => emit(AuthState.unauthenticated(failure.message)),
      (_) => emit(const AuthState.unauthenticated('Logout berhasil')),
    );
  }
}
