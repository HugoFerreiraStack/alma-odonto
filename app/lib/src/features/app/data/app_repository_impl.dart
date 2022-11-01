import 'package:almaodonto/src/core/extensions/constants.dart';
import 'package:almaodonto/src/features/app/domain/entities/cidade_estado_entity.dart';
import 'package:almaodonto/src/features/app/domain/entities/especialidades.dart';
import 'package:almaodonto/src/features/app/domain/entities/estados_entity.dart';
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
    FormData formData = FormData.fromMap(
        {'Authorization': 'Bearer ${Constants.authToken}', 'specialty': params.specialty, 'state': params.state, 'search': params.search});
    print(formData.toString());
    try {
      final response = await dio.post('https://api.devalisson.com/v1/clinics/show/', data: formData);
      print(response.data.toString());
      return Right(Clinicas.fromJson(response.data));
    } on DioError catch (err) {
      return Left(ServerFailure(message: 'GET Clinicas: ${err.message}', dioError: err));
    }
  }

  @override
  Future<Either<Failure, Especialidades>> getEspecialidades() async {
    FormData formData = FormData.fromMap({'Authorization': 'Bearer ${Constants.authToken}'});
    try {
      final response = await dio.post(ApiRoutes.ESPECIALIDADES, data: formData);
      return Right(Especialidades.fromJson(response.data));
    } on DioError catch (err) {
      return Left(ServerFailure(message: 'GET Especialidades: ${err.message}', dioError: err));
    }
  }

  @override
  Future<Either<Failure, List<EstadoEntity>>> getEstados() async {
    FormData formData = FormData.fromMap({'Authorization': 'Bearer ${Constants.authToken}'});
    try {
      final response = await dio.post(ApiRoutes.ESTADOS, data: formData);

      return Right(List.from(response.data['data']).map((f) => EstadoEntity.fromJson(f)).toList());
    } on DioError catch (err) {
      return Left(ServerFailure(message: 'GET  Estados: ${err.message}', dioError: err));
    }
  }

  @override
  Future<Either<Failure, CidadeEstado>> getCidades() async {
    FormData formData = FormData.fromMap({'Authorization': 'Bearer ${Constants.authToken}'});
    try {
      final response = await dio.post(ApiRoutes.CIDADE_ESTADO, data: formData);

      return Right(CidadeEstado.fromJson(response.data));
    } on DioError catch (err) {
      return Left(ServerFailure(message: 'GET  Cidades: ${err.message}', dioError: err));
    }
  }
}
