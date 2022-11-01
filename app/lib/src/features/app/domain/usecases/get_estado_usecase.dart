import 'package:almaodonto/src/features/app/domain/entities/cidade_estado_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/estados_entity.dart';
import '../repositories/app_repository.dart';

class GetEstadosUsecase extends NoParamUsecase<List<EstadoEntity>> {
  final AppRepository repository;
  GetEstadosUsecase(this.repository);

  @override
  Future<Either<Failure, List<EstadoEntity>>> execute() async {
    return await repository.getEstados();
  }
}
