import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../features/auth/presentation/controllers/login_controller.dart';

class AuthInterceptors extends InterceptorsWrapper {
  final String? token;

  AuthInterceptors(this.token);

  final LoginController controller = Get.find();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      controller.messageErrorDio = err.response?.statusCode;
      return;
    }
    super.onError(err, handler);
  }
}
