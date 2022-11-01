import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/cidade_estado_entity.dart';
import '../repositories/app_repository.dart';

class GetCidadesUsecase extends NoParamUsecase<CidadeEstado> {
  final AppRepository repository;
  GetCidadesUsecase(this.repository);

  @override
  Future<Either<Failure, CidadeEstado>> execute() async {
    return await repository.getCidades();
  }
}
