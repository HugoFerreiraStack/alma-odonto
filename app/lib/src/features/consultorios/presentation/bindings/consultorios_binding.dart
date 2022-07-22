import 'package:almaodonto/src/features/consultorios/presentation/controllers/consultorios_controller.dart';
import 'package:get/get.dart';

class ConsultoriosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsultoriosController>(() => ConsultoriosController());
  }
}
