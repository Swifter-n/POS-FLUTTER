import 'package:avis_pos/core/failures/failure.dart';
import 'package:avis_pos/data/datasources/auth_remote_datasource.dart';
import 'package:avis_pos/data/model/payloads/login_payload.dart';
import 'package:avis_pos/data/model/responses/user_model.dart';
import 'package:avis_pos/domain/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserModel>> login(LoginPayload payload) async {
    try {
      final user = await remoteDataSource.login(payload);
      return Right(user);
    } catch (e) {
      return Left(
        Failure.serverError(
          message: e.toString().replaceAll('Exception: ', ''),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(
        Failure.serverError(
          message: e.toString().replaceAll('Exception: ', ''),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> getProfile() async {
    try {
      final user = await remoteDataSource.getProfile();
      return Right(user);
    } catch (e) {
      return Left(
        Failure.serverError(
          message: e.toString().replaceAll('Exception: ', ''),
        ),
      );
    }
  }
}
