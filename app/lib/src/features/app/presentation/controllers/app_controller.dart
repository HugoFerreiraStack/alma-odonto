import 'dart:developer';

import 'package:almaodonto/src/features/app/domain/entities/user_app.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../auth/domain/entities/check_login_result.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  final PageController pageController = PageController();
  final GlobalKey pageViewKey = GlobalKey();
  final GlobalKey bottomNavKey = GlobalKey();

  final _currentPage = 0.obs;
  get currentPage => _currentPage.value;
  set currentPage(value) => _currentPage.value = value;

  final _isLogged = false.obs;
  get isLogged => _isLogged.value;
  set isLogged(value) => _isLogged.value = value;

  final _loggedUser = UserApp().obs;
  UserApp get loggedUser => _loggedUser.value;
  set loggedUser(UserApp value) => _loggedUser.value = value;

  final _clienteAtivo = CheckLoginResult().obs;
  CheckLoginResult get clienteAtivo => _clienteAtivo.value;
  set clienteAtivo(CheckLoginResult value) => _clienteAtivo.value = value;

  final _cpf = ''.obs;
  get cpf => _cpf.value;
  set cpf(value) => _cpf.value = value;

  void animateToPage(int page) {
    currentPage = page;
    pageController.jumpToPage(page);
  }

  showUserData() {
    print('DADOS DO USUARIO');
    log(loggedUser.toJson().toString());
  }
}
