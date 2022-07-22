import 'dart:developer';

import 'package:dio/dio.dart';

abstract class Failure implements Exception {
  final String? message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure({String? message, DioError? dioError}) : super(message) {
    if (dioError != null) {
      log(dioError.error.toString());
    }
    if (message != null) log(message.toString());
  }
}

class AppFailure extends Failure {
  AppFailure(String? message) : super(message) {
    log(message.toString());
  }
}
