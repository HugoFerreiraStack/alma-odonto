import 'package:almaodonto/src/features/auth/domain/usecases/check_login_usecase.dart';
import 'package:almaodonto/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dio_helper.dart';
import '../../data/repositories/login_repository.dart';
import '../controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    final CheckLoginUseCase checkLoginUseCase = CheckLoginUseCase(LoginRepositoryImpl(dio: Get.find<CustomDio>()));
    final LoginUseCase loginUseCase = LoginUseCase(LoginRepositoryImpl(dio: Get.find<CustomDio>()));
    Get.put<LoginController>(LoginController(checkLoginUseCase, loginUseCase));
  }
}
