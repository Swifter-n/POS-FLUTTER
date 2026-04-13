import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError({required String message}) = _ServerError;
  const factory Failure.apiError({required String message}) = _ApiError;
  const factory Failure.networkError({required String message}) = _NetworkError;
  const factory Failure.unknownError({required String message}) = _UnknownError;
}
