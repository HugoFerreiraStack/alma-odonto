import 'package:almaodonto/src/features/app/domain/entities/clinicas.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/especialidades.dart';
import '../entities/search_clinics_params.dart';

abstract class AppRepository {
  Future<Either<Failure, Clinicas>> getClinicas(SearchClinicParams params);
  Future<Either<Failure, Especialidades>> getEspecialidades();
}
