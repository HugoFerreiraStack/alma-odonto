import 'package:almaodonto/src/core/extensions/constants.dart';
import 'package:almaodonto/src/features/app/domain/entities/especialidades.dart';
import 'package:dartz/dartz.dart';

import 'package:almaodonto/src/features/app/domain/entities/search_clinics_params.dart';

import 'package:almaodonto/src/features/app/domain/entities/clinicas.dart';

import 'package:almaodonto/src/core/errors/failure.dart';
import 'package:dio/dio.dart';

import '../../../core/helpers/api_routes.dart';
import '../domain/repositories/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final Dio dio;

  AppRepositoryImpl(this.dio);
  @override
  Future<Either<Failure, Clinicas>> getClinicas(SearchClinicParams params) async {
    FormData formData =
        FormData.fromMap({'Authorization': Constants.authToken, 'specialty': params.specialty, 'state': params.state, 'search': params.search});
    try {
      final response = await dio.post(ApiRoutes.CLINICAS, data: formData);
      return Right(Clinicas.fromJson(response.data));
    } on DioError catch (err) {
      return Left(ServerFailure(message: 'GET Clinicas: ${err.message}', dioError: err));
    }
  }

  @override
  Future<Either<Failure, Especialidades>> getEspecialidades() async {
    FormData formData = FormData.fromMap({'Authorization': Constants.authToken});
    try {
      final response = await dio.post(ApiRoutes.ESPECIALIDADES, data: formData);
      return Right(Especialidades.fromJson(response.data));
    } on DioError catch (err) {
      return Left(ServerFailure(message: 'GET Especialidades: ${err.message}', dioError: err));
    }
  }
}
