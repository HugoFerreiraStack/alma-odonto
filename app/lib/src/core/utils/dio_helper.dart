import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../extensions/constants.dart';
import 'dio_interceptor.dart';

class CustomDio extends DioForNative {
  Interceptor? _tokenInterceptor;
  String? _token;

  CustomDio() : super() {
    options.baseUrl = Constants.kBaseUrl;
  }

  updateToken(String? token) {
    _token = token;

    if (_tokenInterceptor != null) {
      if (interceptors.contains(_tokenInterceptor)) {
        interceptors.remove(_tokenInterceptor);
      }
    }
    _tokenInterceptor = AuthInterceptors(_token);
    interceptors.add(_tokenInterceptor as Interceptor);
  }

  removeToken() {
    updateToken(null);
  }
}
