import 'package:get/get.dart';

import '../../../../core/utils/dio_helper.dart';
import '../controllers/app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CustomDio>(CustomDio(), permanent: true);
    Get.put<AppController>(AppController());
  }
}
