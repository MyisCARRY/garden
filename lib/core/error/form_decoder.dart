import 'package:garden/core/error/failures.dart';

Failure handleError(dynamic error, Failure defaultFailure) {
  if (error is Failure) {
    return error;
  }
  return defaultFailure;
}
