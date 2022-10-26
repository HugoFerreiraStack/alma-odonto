import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/especialidades.dart';
import '../repositories/app_repository.dart';

class GetEspecialidadesUsecase extends NoParamUsecase<Especialidades> {
  final AppRepository repository;
  GetEspecialidadesUsecase(this.repository);

  @override
  Future<Either<Failure, Especialidades>> execute() async {
    return await repository.getEspecialidades();
  }
}
