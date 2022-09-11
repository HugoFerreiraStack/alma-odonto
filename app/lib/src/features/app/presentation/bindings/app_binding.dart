import 'package:get/get.dart';

import '../../../../core/utils/dio_helper.dart';
import '../../../auth/data/repositories/login_repository.dart';
import '../../../auth/domain/usecases/check_login_usecase.dart';
import '../../../auth/domain/usecases/login_usecase.dart';
import '../../../auth/presentation/controllers/login_controller.dart';
import '../controllers/app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CustomDio>(CustomDio(), permanent: true);
    Get.put<AppController>(AppController());
  }
}
