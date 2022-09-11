import 'dart:developer';

import 'package:almaodonto/src/features/app/domain/entities/user_app.dart';
import 'package:almaodonto/src/features/auth/domain/entities/login_params.dart';
import 'package:dartz/dartz.dart';
import 'package:almaodonto/src/features/auth/domain/entities/check_login_params.dart';
import 'package:almaodonto/src/core/errors/failure.dart';
import 'package:dio/dio.dart';

import '../../../../core/helpers/api_routes.dart';
import '../../domain/entities/check_login_result.dart';
import '../../domain/repositories/login_repository.dart';

enum UserStatus { firstAccess, complete }

class LoginRepositoryImpl extends LoginRepository {
  final Dio dio;

  LoginRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, CheckLoginResult>> checkLogin(CheckLoginParams params) async {
    try {
      var formData = FormData.fromMap({
        'document': params.document,
        'birthday': params.birthday,
      });
      final response = await dio.post(ApiRoutes.CHECK_LOGIN, data: formData);

      return Right(CheckLoginResult.fromJson(response.data));
    } on DioError catch (err) {
      log(err.response.toString());
      return Left(ServerFailure(message: 'POST check login: ${err.response}', dioError: err));
    }
  }

  @override
  Future<Either<Failure, UserApp>> login(LoginParams params) async {
    try {
      var formData = FormData.fromMap({
        'document': params.document,
        'password': params.password,
      });
      final response = await dio.post(ApiRoutes.LOGIN, data: formData);

      return Right(UserApp.fromJson(response.data));
    } on DioError catch (err) {
      log(err.response.toString());
      return Left(ServerFailure(message: 'POST login: ${err.response}', dioError: err));
    }
  }
}
