import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../../app/domain/entities/user_app.dart';
import '../entities/login_params.dart';
import '../repositories/login_repository.dart';

class LoginUseCase extends ParamUsecase<UserApp, LoginParams> {
  final LoginRepository repository;
  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserApp>> execute(LoginParams params) {
    return repository.login(params);
  }
}
