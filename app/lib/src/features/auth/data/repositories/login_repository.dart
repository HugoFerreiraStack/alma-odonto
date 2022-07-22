import 'package:dio/dio.dart';

import '../../domain/repositories/login_repository.dart';

enum UserStatus { firstAccess, complete }

class LoginRepositoryImpl extends LoginRepository {
  final Dio dio;

  LoginRepositoryImpl({required this.dio});
}
