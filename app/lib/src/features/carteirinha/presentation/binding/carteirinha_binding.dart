import 'package:almaodonto/src/features/carteirinha/presentation/controllers/carteirinha_controller.dart';
import 'package:get/get.dart';

class CarteirinhaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarteirinhaController>(() => CarteirinhaController());
  }
}
