import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';

abstract class BaseUseCase<T,Parameters>{
  Future<Either<ServerException,T>> call(Parameters parameters);
}
class NoParameters {
  NoParameters();
}