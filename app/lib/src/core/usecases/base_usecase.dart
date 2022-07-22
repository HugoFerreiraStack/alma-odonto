import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class ParamUsecase<Type, Params> {
  Future<Either<Failure, Type>> execute(Params params);
}

abstract class NoParamUsecase<Type> {
  Future<Either<Failure, Type>> execute();
}
