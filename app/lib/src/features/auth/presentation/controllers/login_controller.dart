import 'dart:developer';

import 'package:almaodonto/src/features/auth/domain/entities/check_login_params.dart';
import 'package:almaodonto/src/features/auth/domain/entities/check_login_result.dart';
import 'package:almaodonto/src/features/auth/domain/usecases/check_login_usecase.dart';
import 'package:almaodonto/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/dio_helper.dart';
import '../../../app/presentation/controllers/app_controller.dart';
import '../../domain/entities/login_params.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  LoginController(this.checkLoginUseCase, this.loginUseCase);

  final AppController appController = Get.find();
  final CheckLoginUseCase checkLoginUseCase;
  final LoginUseCase loginUseCase;
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController dataNascimentoController = TextEditingController();

  final GetStorage box = GetStorage();

  final _exibirSenha = false.obs;
  get exibirSenha => _exibirSenha.value;
  set exibirSenha(value) => _exibirSenha.value = value;

  final _carregandoLogin = false.obs;
  get carregandoLogin => _carregandoLogin.value;
  set carregandoLogin(value) => _carregandoLogin.value = value;

  final _salvarUsuario = false.obs;
  get salvarUsuario => _salvarUsuario.value;
  set salvarUsuario(value) => _salvarUsuario.value = value;

  final _messageErrorDio = ''.obs;
  get messageErrorDio => _messageErrorDio.value;
  set messageErrorDio(value) => _messageErrorDio.value = value;

  final _senha = ''.obs;
  get senha => _senha.value;
  set senha(value) => _senha.value = value;

  final _loggedUser = CheckLoginResult().obs;
  CheckLoginResult get loggedUser => _loggedUser.value;
  set loggedUser(CheckLoginResult value) => _loggedUser.value = value;

  void setDioToken(String token) {
    Get.find<CustomDio>().updateToken(token);
  }

  void checkUser() async {
    // Future.delayed(const Duration(seconds: 3), () {
    //   carregandoLogin = false;
    //   Get.offAndToNamed(AppRoutes.LOGIN);
    // });
  }

  void checkCpf() async {
    carregandoLogin = true;
    var inputFormat = DateFormat('dd/MM/yyyy');
    var inputDate = inputFormat.parse(dataNascimentoController.text);
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);

    log(dataNascimentoController.text.toString());
    appController.cpf = cpfController.text;

    final CheckLoginParams params = CheckLoginParams(document: cpfController.text, birthday: outputDate);
    log(params.toJson().toString());
    final result = await checkLoginUseCase.execute(params);
    result.fold((l) {
      carregandoLogin = false;
    }, (r) {
      loggedUser = r;
      if (r.status == 'sucess') {
        redirectUser();
      } else {
        carregandoLogin = false;
        messageErrorDio = 'Usuario não encontrado';
      }
    });
  }

  void redirectUser() async {
    if (loggedUser.data?.active == '0') {
      carregandoLogin = false;
      Future.delayed(const Duration(seconds: 3), () {
        carregandoLogin = false;
        Get.toNamed(AppRoutes.CLIENTE_INATIVO);
      });
    } else if (loggedUser.data?.active == '1') {
      carregandoLogin = false;
      Future.delayed(const Duration(seconds: 3), () {
        carregandoLogin = false;
        Get.toNamed(AppRoutes.CLIENTE_ATIVO);
      });
    }
  }

  Future<void> login() async {
    log(appController.cpf);
    final LoginParams params = LoginParams(document: appController.cpf, password: senhaController.text);
    log(params.toJson().toString());

    final signin = await loginUseCase.execute(params);

    signin.fold((l) {
      messageErrorDio = l.message;
      log(l.message.toString());
      carregandoLogin = false;
    }, (r) {
      if (salvarUsuario == true) {
        setDioToken(r.data!.token);
        box.write('token', r.data!.token);
        final finalToken = box.read('token');
        log(finalToken.toString());
        appController.isLogged = true;
        appController.loggedUser = r;
        carregandoLogin = false;
      } else {
        carregandoLogin = false;
      }
      log('Logou');
      Get.offAndToNamed(AppRoutes.APP);
    });
  }
}
