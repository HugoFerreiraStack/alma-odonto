import 'package:almaodonto/src/features/auth/domain/entities/check_login_params.dart';
import 'package:almaodonto/src/features/auth/domain/entities/check_login_result.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../repositories/login_repository.dart';

class CheckLoginUseCase extends ParamUsecase<CheckLoginResult, CheckLoginParams> {
  final LoginRepository repository;
  CheckLoginUseCase(this.repository);

  @override
  Future<Either<Failure, CheckLoginResult>> execute(CheckLoginParams params) {
    return repository.checkLogin(params);
  }
}
