import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../app/domain/entities/user_app.dart';
import '../entities/check_login_params.dart';
import '../entities/check_login_result.dart';
import '../entities/login_params.dart';

abstract class LoginRepository {
  Future<Either<Failure, CheckLoginResult>> checkLogin(CheckLoginParams params);
  Future<Either<Failure, UserApp>> login(LoginParams params);
}
