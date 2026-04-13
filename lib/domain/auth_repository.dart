import 'package:avis_pos/core/failures/failure.dart';
import 'package:avis_pos/data/model/payloads/login_payload.dart';
import 'package:avis_pos/data/model/responses/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<Failure, UserModel>> login(LoginPayload payload);
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, UserModel>> getProfile();
}
