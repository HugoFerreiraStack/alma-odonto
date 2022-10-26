import 'package:almaodonto/src/features/app/domain/entities/clinicas.dart';
import 'package:almaodonto/src/features/app/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/search_clinics_params.dart';

class GetClinicasUsecase extends ParamUsecase<Clinicas, SearchClinicParams> {
  final AppRepository repository;
  GetClinicasUsecase(this.repository);

  @override
  Future<Either<Failure, Clinicas>> execute(SearchClinicParams params) async {
    return await repository.getClinicas(params);
  }
}
