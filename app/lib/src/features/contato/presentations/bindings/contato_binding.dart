import 'package:almaodonto/src/features/contato/presentations/controllers/contato_controller.dart';
import 'package:get/get.dart';

class ContatoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContatoController>(() => ContatoController());
  }
}
