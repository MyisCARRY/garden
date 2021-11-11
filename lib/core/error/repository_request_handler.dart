import 'package:dartz/dartz.dart';
import 'package:fimber/fimber.dart';
import 'package:garden/core/error/exceptions.dart';
import 'package:garden/core/error/failures.dart';
import 'package:garden/core/helper/type_aliases.dart';

class RepositoryRequestHandler<T> {
  FutureFailable<T> call({
    required Failure defaultFailure,
    required Future<T> Function() request,
  }) async {
    try {
      return Right(await request());
    } catch (error) {
      Fimber.e(error.toString());
      return Left(errorHandler(error, defaultFailure));
    }
  }
}
